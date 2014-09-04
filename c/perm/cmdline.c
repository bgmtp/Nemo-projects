/*
  CMDLINE.C
  =========
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Function to parse command line and return integral argument
*/


#include <stdio.h>
#include <stdlib.h>

#include "cmdline.h"


unsigned ParseCmdLine(int argc, char *argv[]) {
    unsigned n;
    char * endptr;

    if ( argc < 2 ) {
        fprintf(stderr, "You must supply an argument\n");
        exit(EXIT_FAILURE);
    }
    else if ( argc > 2 ) {
        fprintf(stderr, "You must only supply one argument\n");
        exit(EXIT_FAILURE);
    }

    n = (unsigned) strtoul(argv[1], &endptr, 0);

    if ( *endptr ) {
        fprintf(stderr, "You must supply a whole number as an argument\n");
        exit(EXIT_FAILURE);
    }
    else if ( n > 26 ) {
        fprintf(stderr, "You must specify a number less than 27\n");
        exit(EXIT_FAILURE);
    }
    else if ( n < 1 ) {
        fprintf(stderr, "You must specify a number greater than 0\n");
        exit(EXIT_FAILURE);
    }

    return n;
}
