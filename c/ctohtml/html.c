/*
  HTML.C
  ======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  HTML functions
*/


#include <stdio.h>

#include "html.h"


/*  Output XHTML prolog, head, and opening body tag  */

void OutputHTMLHeader(void) {
    static const char * css_location = "/css/c.css";

    puts("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
    puts("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"");
    puts("    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");

    puts("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");

    puts("<head>");
    puts("    <title>CtoHTML Output</title>");
    printf("    <link rel=\"stylesheet\" href=\"%s\" type=\"text/css\" />\n",
           css_location);
    puts("    <meta name=\"generator\" content=\"CtoHTML\" />");
    puts("</head>\n");

    puts("<body>\n\n");
}


/*  Output email link and closing XHTML document tags  */

void OutputHTMLFooter(void) {
    static const char * email = "mail@paulgriffiths.net";

    puts("<!--  Email link  -->\n");
    puts("<div id=\"link\">\n");
    puts("<p class=\"email\">");
    printf("Please send any comments, suggestions, bug reports to ");
    printf("<a href=\"mailto:%s\">%s</a>\n", email, email);
    puts("</p>\n<hr />\n\n</div>\n");
    puts("</body>\n");
    puts("</html>");
}


/*  Output file heading and create division  */

void OutputFileHeader(const char * filename) {
    printf("<!--  Start of %s listing  -->\n\n", filename);
    printf("<div id=\"%s\">\n", filename);
    printf("<h2>%s</h2>\n\n", filename);
    printf("<pre>");
}


/*  Close file division  */

void OutputFileFooter(void) {
    puts("</pre>");
    puts("<hr />");
    puts("</div>\n\n");
}


/*  Translate certain HTML escaped entities  */

void TranslateToken(int c) {
    switch(c) {
    case  '<':
        printf("&lt;");
        break;

    case '>':
        printf("&gt;");
        break;

    case '&':
        printf("&amp;");
        break;

    case '"':
        printf("&quot;");
        break;

    default:
        putchar(c);
        break;
    }
}
