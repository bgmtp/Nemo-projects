/*
  DATA_LIST.C
  ===========
  (c) Copright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Functions for manipulating the data using linked lists
*/


#include <stdio.h>
#include <stdlib.h>

#include "data.h"


struct node {
    char n;
    struct node * next;
};

static struct node * data;


/*  Initialize memory for data  */

void InitializeData(unsigned n) {
    struct node * temp = NULL;
    char set[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    unsigned i = 0;

    while ( i < n ) {
        if ( data == NULL ) {
            data = malloc(sizeof *data);
            temp = data;
        }
        else {
            temp->next = malloc(sizeof *(temp->next));
            temp = temp->next;
        }

        if ( temp == NULL ) {
            fprintf(stderr, "Memory allocation failure\n");
            exit(EXIT_FAILURE);
        }
        
        temp->n = set[i++];
        temp->next = NULL;
    }
}


/*  Free memory used for data  */

void FreeData(void) {
    struct node * temp = data;

    while ( data ) {
        temp = data->next;
        free(data);
        data = temp;
    }
}


/*  Remove data item at position 'pos'  */

char RemoveItem(unsigned pos) {
    struct node * temp = data;
    struct node * last = NULL;
    char d;

    while ( temp ) {
        if ( 0 == pos-- ) {
            if ( last )
                last->next = temp->next;
            else
                data = temp->next;

            d = temp->n;

            free(temp);
            return d;
        }
        last = temp;
        temp = temp->next;
    }

    fprintf(stderr, "Position specifed out of bounds.\n");
    exit(EXIT_FAILURE);
}


/*  Insert data item 'n' at position 'pos'  */

void InsertItem(char n, unsigned pos) {
    struct node * temp = data;
    struct node * last = NULL;

    while ( temp && pos-- ) {
        last = temp;
        temp = temp->next;
    }

    if ( temp == NULL && pos ) {
        fprintf(stderr, "Position out of bounds\n");
        exit(EXIT_FAILURE);
    }

    if ( last ) {
        last->next = malloc(sizeof *(last->next));
        last = last->next;
    }
    else {
        data = malloc(sizeof *data);
        last = data;
    }

    if ( last == NULL ) {
        fprintf(stderr, "Memory allocation failure\n");
        exit(EXIT_FAILURE);
    }

    last->next = temp;
    last->n = n;
}
