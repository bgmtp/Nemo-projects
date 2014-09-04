/*
  FILE.H
  ======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Interface to input and output file operations
*/


#ifndef PG_FILE_H
#define PG_FILE_H

#define MAX_FILENAME_LEN 256

FILE * GetNextInputFile(int argc, char *argv[], char * filename);

#endif  /* PG_FILE_H */
