/*
  HTML.H
  ======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Interface to HTML output functions
*/


#ifndef PG_HTML_H
#define PG_HTML_H

void OutputHTMLHeader(void);
void OutputHTMLFooter(void);
void OutputFileHeader(const char * filename);
void OutputFileFooter(void);
void TranslateToken(int c);

#endif  /* PG_HTML_H */
