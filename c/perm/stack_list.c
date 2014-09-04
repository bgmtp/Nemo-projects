/*
  STACK_LIST.C
  ============
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Stack operations using linked lists
*/


#include <stdio.h>
#include <stdlib.h>

#include "stack.h"


struct node {
    char n;
    struct node * next;
};

static struct node * stack;


/*  Push item 'n' onto the stack  */

void Push(char n) {
    struct node * temp = stack;

    if ( stack == NULL ) {
        stack = malloc(sizeof(struct node));
        temp = stack;
    }
    else {
        while ( temp->next )
            temp = temp->next;
        temp->next = malloc(sizeof(struct node));
        temp = temp->next;
    }

    if ( temp == NULL ) {
        fprintf(stderr, "Memory allocation failure\n");
        exit(EXIT_FAILURE);
    }

    temp->n = n;
    temp->next = NULL;
}


/*  Pop top item from the stack  */

char Pop(void) {
    struct node * temp = stack;
    struct node * last = NULL;
    char n;

    if ( stack == NULL ) {
        fprintf(stderr, "Stack empty!\n");
        exit(EXIT_FAILURE);
    }

    while ( temp->next ) {
        last = temp;
        temp = temp->next;
    }

    n = temp->n;
    free(temp);
    if ( last )
        last->next = NULL;
    else
        stack = NULL;
    
    return n;
}


/*  Output contents of stack  */

void PrintStack(void) {
    struct node * temp = stack;

    while ( temp ) {
        putchar(temp->n);
        temp = temp->next;
    }

    putchar('\n');
}

