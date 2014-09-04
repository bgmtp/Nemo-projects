/*
  DATA_ARRAY.C
  ============
  (c) Copright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Functions for manipulating the data using arrays
*/


#include <stdio.h>
#include <stdlib.h>

#include "data.h"


static char data[27] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
static unsigned size;


/*  Initialize memory for data  */

void InitializeData(unsigned n) {
    size = n;
}


/*  Free memory used for data  */

void FreeData(void) {
    return;
}


/*  Remove data item at position 'pos'  */

char RemoveItem(unsigned pos) {
    char d = data[pos];

    if ( pos >= size-- ) {
        fprintf(stderr, "Data position %u is out of bounds.\n", pos);
        exit(EXIT_FAILURE);
    }

    while ( pos < size ) {
        data[pos] = data[pos+1];
        ++pos;
    }

    return d;
}


/*  Insert data item 'n' at position 'pos'  */

void InsertItem(char n, unsigned pos) {
    int i = (signed) size;

    if ( pos > size++ ) {
        fprintf(stderr, "Data position %u is out of bounds.\n", pos);
        exit(EXIT_FAILURE);
    }

    while ( --i >= (signed) pos )
        data[i+1] = data[i];

    data[pos] = n;
}
