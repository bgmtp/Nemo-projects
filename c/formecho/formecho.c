/*

  FORMECHO.C
  ==========
  (c) Paul Griffiths 1999
  Email: mail@paulgriffiths.net

  Simple CGI program to echo the keys and values
  returned from an HTML form.

*/


#include <stdlib.h>
#include <stdio.h>
#include "cgihelp.h"


/*  Forward function declaratios  */

void DisplayErrorHTML();


/*  main() function  */

int main() {
    int   n = 1;
    char *key;
    char *value;

    /*  Get key/value pairs from input  */

    if ( !InitInput(1000) )
	DisplayErrorHTML();

    
    /*  Output HTML header  */

    printf("Content-Type: text/html\n\n");

    printf("<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 4.0//EN\">\n\n");
    printf("<HTML>\n\n<HEAD>\n");
    printf("    <TITLE>Formecho Output</TITLE>\n");
    printf("</HEAD>\n\n");
    printf("<BODY>\n\n");


    /*  Output table of key/value pairs  */

    printf("<TABLE BORDER=1 CELLPADDING=10px>\n\n");
    printf("    <TR>\n");
    printf("        <TH>Key</TH>\n\n");
    printf("        <TH>Value</HT>\n\n");
    printf("    </TR>\n\n");

    while ( (key = GetIndexedKey(n)) && (value = GetIndexedValue(n)) ) {
	printf("    <TR>\n");
	printf("        <TD>%s</TD>\n", key);
	printf("        <TD>%s</TD>\n", value);
	printf("    </TR>\n\n");
	++n;
    }

    printf("</TABLE>\n\n");


    /*  Output HTML footer  */

    printf("</BODY>\n\n</HTML>\n\n");


    /*  Clean up and exit  */

    FreeCGI();
    return 0;
}


/*  Outputs HTML indicating error if CGI functions fail  */

void DisplayErrorHTML() {
    printf("Content-Type: text/html\n\n");
    
    printf("<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 4.0//EN\">\n\n");
    printf("<HTML>\n\n<HEAD>\n");
    printf("    <TITLE>Formecho Output</TITLE>\n");
    printf("</HEAD>\n\n");
    printf("<BODY>\n\n");
    printf("<H2>Error!</H2>\n\n");
    printf("<P>An error has occurred. Please contact the ");
    printf("site administrator.\n\n<BR><HR><BR>\n\n");
    printf("</BODY>\n\n</HTML>\n");

    exit(EXIT_FAILURE);
}
