/*
  PROCESS.C
  =========
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Input file processing routines
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "process.h"
#include "html.h"
#include "token.h"


#define M_COMMENT  0
#define M_KEYWORD  1
#define M_PREPROC  2
#define M_STDFUNC  3

static int GetNextToken(FILE * infile);
static void OutputToken(FILE * infile, int tokentype);


/*  Processes an input file  */

void ProcessFile(FILE * infile, const char * filename) {
    int tokentype;

    OutputFileHeader(filename);

    while ( (tokentype = GetNextToken(infile)) >= 0 ) {
        OutputToken(infile, tokentype);
    }

    OutputFileFooter();
}


/*  Finds the next token and returns its type  */

int GetNextToken(FILE * infile) {
    enum tokens tokentype = NOTOKEN;
    char buffer[MAX_TOKEN_LEN];
    static int quote = 0;
    static int escape = 0;
    fpos_t pos;
    int c;


    /*  Output characters until we hit a markup token candidate  */

    for ( ;; ) {
        c = getc(infile);

        if ( c == EOF )
            return -1;


        /*  See if next character is consistent with the start of
            a keyword, library function, comment or preprocessing
            directive. If it is, and it isn't quoted, exit loop.   */

        if ( (islower(c) || c == '/' || c == '#') && quote == 0 )
            break;
        else {

            /*  Logic to tell whether we are in a quote  */

            if ( quote == 0 && !(escape % 2) && (c == '"' || c == '\'') )
                quote = c;
            else if ( quote == c && !(escape % 2) )
                quote = 0;


            /*  Quotation marks can be escaped, so avoid confusion  */

            if ( quote && c == '\\' )
                ++escape;
            else
                escape = 0;
        }
        TranslateToken(c);
    }


    /*  Place first character of token candidate back onto stream  */

    ungetc(c, infile);


    /*  Save file position  */

    if ( fgetpos(infile, &pos) ) {
        perror("Error getting file position");
        exit(EXIT_FAILURE);
    }


    /*  Read biggest possible token size into buffer  */

    fgets(buffer, MAX_TOKEN_LEN, infile);


    /*  Find out what type of token we have, if any  */

    if ( !strncmp(buffer, "/*", 2) )
        tokentype = COMMENT;
    else if ( !strncmp(buffer, "//", 2) )
        tokentype = CPP_COMMENT;
    else {
        if ( IsToken(buffer, KEYWORD) )
            tokentype = KEYWORD;
        else if ( IsToken(buffer, PREPROC) )
            tokentype = PREPROC;
        else if ( IsToken(buffer, STDFUNC) )
            tokentype = STDFUNC;
    }


    /*  Reset file position to beginning of token,
        because we will be outputting it soon       */

    if ( fsetpos(infile, &pos) ) {
        perror("Error setting file position");
        exit(EXIT_FAILURE);
    }

    return tokentype;
}


/*  Outputs the token of the specified
    type at the current file position   */

void OutputToken(FILE * infile, int tokentype) {
    static char * class[] = { "comment", "keyword", "preproc", "stdfunc" };
    int c;


    /*  Print token & markup according to what type it is  */

    switch ( tokentype ) {
      
    case COMMENT:
        printf("<span class=\"%s\">", class[M_COMMENT]);
        putchar(getc(infile));
        putchar(getc(infile));
        {
            /*  Don't markup anything else till end of comment  */

            int c[2];
            TranslateToken((c[0] = getc(infile)));
            for ( ;; ) {
                c[1] = getc(infile);

                if ( c[1] == EOF )
                    break;

                TranslateToken(c[1]);

                if ( c[0] == '*' && c[1] == '/' )
                    break;

                c[0] = c[1];
            }
        }
        printf("</span>");
        break;

    case CPP_COMMENT:
        printf("<span class=\"%s\">", class[M_COMMENT]);
        for ( ;; ) {
            c = getc(infile);

            /*  Don't markup anything else till end of line or file  */

            if ( c == '\n' || c == EOF ) {
                ungetc(c, infile);
                printf("</span>");
                break;
            }

            TranslateToken(c);
        }
        break;

    case KEYWORD:
    case STDFUNC:
        printf("<span class=\"%s\">",
               class[tokentype == KEYWORD ? M_KEYWORD : M_STDFUNC]);

        /*  Rest of token consists of lower case chars and underscore  */

        c = getc(infile);
        while ( islower(c) || c == '_' ) {
            putchar(c);
            c = getc(infile);
        }

        ungetc(c, infile);
        printf("</span>");
        break;

    case PREPROC:
        printf("<span class=\"%s\">", class[M_PREPROC]);

        putchar(getc(infile));
        while ( islower((c = getc(infile))) )
            putchar(c);

        ungetc(c, infile);
        printf("</span>");
        break;

    case NOTOKEN:

        /*  First char is lower case, or a '#' or a '/', but
            isn't recognised as a valid token for markup, so
            just output it without marking it up.             */

        c = getc(infile);
        if ( islower(c) || c == '#' ) {
            putchar(c);
            c = getc(infile);
            while ( islower(c) || c == '_' ) {
                putchar(c);
                c = getc(infile);
            }
            ungetc(c, infile);
        }
        else
            putchar(c);

        break;

    default:
        break;
    }
}

