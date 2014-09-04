/*
  PRIME.C
  =======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  A program to find all prime numbers under 10,000
*/


#include <stdio.h>
#include <stdlib.h>


int prime(int number, int * primes);

int main(void) {
    int primes[10000] = { 3, 0 };
    int i;

    for ( i = 5; i < 10000; i += 2 ) {
        if ( prime(i, primes) )
            printf("%8d", i);
    }

    putchar('\n');

    return EXIT_SUCCESS;
}


/*  Returns 1 if none of the integers in the array
    pointed to by 'primes' are factors of 'number',
    and 0 if at least one of them is a factor. If none
    of the numbers are factors, 'number' is added to
    the list of 'primes'                                */

int prime(int number, int * primes) {
    int i = 0;

    while ( primes[i] ) {
        if ( (number % primes[i++]) == 0 )
            return 0;
    }
    
    primes[i] = number;
    return 1;
}

