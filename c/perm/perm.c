/*
  PERM.C
  ======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Prints all the possible permutations of 'n' items.
  'n' must be supplied as the sole command line argument.
*/


#include <stdio.h>
#include <stdlib.h>

#include "data.h"
#include "stack.h"
#include "cmdline.h"


static void Perm(unsigned n);

static int count = 0;


int main(int argc, char *argv[]) {
    unsigned n = ParseCmdLine(argc, argv);

    InitializeData(n);

    printf("Permutations of %u items:\n\n", n);
    Perm(n);
    printf("\n%d permutations in all.\n", count);

    FreeData();

    return EXIT_SUCCESS;
}

void Perm(unsigned n) {
    unsigned item;

    if ( n == 0 ) {
        PrintStack();
        ++count;
        return;
    }

    for ( item = 0; item < n; ++item ) {
        Push(RemoveItem(item));
        Perm(n-1);
        InsertItem(Pop(), item);
    }
}
