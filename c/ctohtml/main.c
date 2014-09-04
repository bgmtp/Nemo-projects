/*
  MAIN.C
  ======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  C-to-XHTML converter
*/


#include <stdio.h>
#include <stdlib.h>

#include "file.h"
#include "process.h"
#include "html.h"


int main(int argc, char *argv[]) {
    
    FILE * infile;
    char filename[MAX_FILENAME_LEN] = {0};
    char message[MAX_FILENAME_LEN + 256];


    OutputHTMLHeader();


    /*  Loop through input files and process  */

    while ( (infile = GetNextInputFile(argc, argv, filename)) ) {
        ProcessFile(infile, filename);

        if ( fclose(infile) == EOF ) {
            sprintf(message, "couldn't close input file %s", filename);
            perror(message);
        }
    }


    OutputHTMLFooter();

    return EXIT_SUCCESS;
}

