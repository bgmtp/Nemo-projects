/*
  STACK_ARRAY.C
  =============
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Stack operations using arrays
*/


#include <stdio.h>
#include <stdlib.h>

#include "stack.h"


#define MAX_STACK_SIZE 26

static char stack[MAX_STACK_SIZE];
static int top = -1;


/*  Push item 'n' onto the stack  */

void Push(char n) {
    if ( ++top == MAX_STACK_SIZE ) {
        fprintf(stderr, "Stack full!\n");
        exit(EXIT_FAILURE);
    }

    stack[top] = n;
}


/*  Pop top item from the stack  */

char Pop(void) {
    if ( top < 0 ) {
        fprintf(stderr, "Stack empty!\n");
        exit(EXIT_FAILURE);
    }

    return stack[top--];
}


/*  Output contents of stack  */

void PrintStack(void) {
    int i = 0;

    while ( i <= top )
        putchar(stack[i++]);

    putchar('\n');
}

