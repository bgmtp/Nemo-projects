/*
  PROCESS.H
  =========
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Interface to input file processing routines
*/


#ifndef PG_PROCESS_H
#define PG_PROCESS_H

#include <stdio.h>

#define MAX_TOKEN_LEN 30
enum tokens { NOTOKEN, COMMENT, CPP_COMMENT, KEYWORD, PREPROC, STDFUNC };

void ProcessFile(FILE * infile, const char * filename);

#endif  /* PG_PROCESS_H */
