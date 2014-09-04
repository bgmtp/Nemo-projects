/*
  TOKEN.C
  =======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Utilities for testing for a string token
*/


#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "token.h"
#include "process.h"


int cmptoken(const void * s1, const void * s2);


/*  Returns 1 if the first argument is a
    token of the specified type, 0 otherwise  */

int IsToken(const char * token, enum tokens tokentype) {
    static const char * stdfuncs[] = { "abort", "abs", "acos", "asctime",
        "asin", "assert", "atan", "atan2", "atexit", "atof", "atoi", "atol",
        "bsearch", "calloc", "ceil", "clearerr", "clock", "cos", "cosh",
        "ctime", "difftime", "div", "exit", "exp", "fabs", "fclose", "feof",
        "ferror", "fflush", "fgetc", "fgetpos", "fgets", "floor", "fmod",
        "fopen", "fprintf", "fputc", "fputs", "fread", "free", "freopen",
        "frexp", "fscanf", "fseek", "fsetpos", "ftell", "fwrite", "getc",
        "getchar", "getenv", "gets", "gmtime", "isalnum", "isalpha", "iscntrl",
        "isdigit", "isgraph", "islower", "isprint", "ispunct", "isspace",
        "isupper""isxdigit", "labs", "ldexp", "ldiv", "localtime", "log",
        "log10", "longjmp", "malloc", "memchr", "memcmp", "memcpy", "memmove",
        "memset", "mktime", "modf", "perror", "pow", "printf", "putc",
        "putchar", "puts", "qsort", "raise", "rand", "realloc", "remove",
        "rename", "rewind", "scanf", "setbuf", "setjmp", "setvbuf", "signal",
        "sin", "sinh", "sprintf", "sqrt", "srand", "sscanf", "strcat",
        "strchr", "strcmp", "strcpy", "strcspn", "strerror", "strftime",
        "strlen", "strncat", "strncmp", "strncpy", "strpbrk", "strrchr",
        "strspn", "strstr", "strtod", "strtok", "strtol", "strtoul", "system",
        "tan", "tanh", "time", "tmpfile", "tmpnam", "tolower", "toupper",
        "ungetc", "va_arg", "va_list", "va_start", "vfprintf", "vprintf",
        "vsprintf" };
    
    static const char * keywords[] = { "auto", "break", "case", "char",
        "const", "continue", "default", "do", "double", "else", "enum",
        "extern", "float", "for", "goto", "if", "int", "long", "register",
        "return", "short", "signed", "sizeof", "static", "struct", "switch",
        "typedef", "union", "unsigned", "void", "volatile", "while" };

    static const char * preprocs[] = { "#define", "#elif", "#else", "#endif",
        "#error", "#if", "#ifdef", "#ifndef", "#include", "#line", "#pragma" };

    static size_t numfunc = sizeof stdfuncs / sizeof *stdfuncs;
    static size_t numkey  = sizeof keywords / sizeof *keywords;
    static size_t numproc = sizeof preprocs / sizeof *preprocs;

    int i = 1;
    void * found;
    char temp[MAX_TOKEN_LEN];


    /*  Make copy of token candidate and trim it  */

    strcpy(temp, token);
    while ( temp[i] ) {
        if ( !islower(temp[i]) && temp[i] != '_' ) {
            temp[i] = 0;
            break;
        }
        ++i;
    }


    /*  See if it is in the token lists  */

    switch ( tokentype ) {
    case STDFUNC:
        found = bsearch(temp, stdfuncs, numfunc, sizeof *stdfuncs, cmptoken);
        break;

    case KEYWORD:
        found = bsearch(temp, keywords, numkey, sizeof *keywords, cmptoken);
        break;

    case PREPROC:
        found = bsearch(temp, preprocs, numproc, sizeof *preprocs, cmptoken);
        break;

    default:
        found = NULL;
    }

    if ( found )
        return 1;
    else
        return 0;
}


/*  Compare function used in above calls to bsearch()  */

int cmptoken(const void * s1, const void * s2) {
    return strcmp(s1, *((char **)s2));
}
