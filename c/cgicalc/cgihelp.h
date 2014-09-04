/*

  CGIHELP.H
  =========
  (c) Paul Griffiths 1999
  Email: mail@paulgriffiths.net

  Interface to CGI helper functions

*/


#ifndef PG_CGIHELP
#define PG_CGIHELP


/*  Global macros  */

#define ERR_BADREQUEST          (1)
#define ERR_BADMALLOC           (2)


/*  Function declarations  */

int    InitInput      (int   maxbuffer);
char * GetValue       (char *key);
char * GetIndexedValue(int   index);
char * GetIndexedKey  (int   index);
void   FreeCGI        ();


#endif    /*  PG_CGIHELP  */
