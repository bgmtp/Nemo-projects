/*
  FILE.C
  ======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Input and output file operations
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "file.h"


/*  Gets the next input file from the command line and returns
    a FILE pointer to it, or NULL if no more input files.       */

FILE * GetNextInputFile(int argc, char *argv[], char * filename) {
    static int n = 1;
    FILE * fp;
    char message[MAX_FILENAME_LEN + 256];

    while ( n < argc ) {
        if ( (fp = fopen(argv[n++], "r")) == NULL ) {
            sprintf(message, "couldn't open input file %s", argv[n-1]);
            perror(message);
            continue;
        }
        else {
            strncpy(filename, argv[n-1], MAX_FILENAME_LEN - 1);
            return fp;
        }
    }

    return NULL;
}

