/*

  CGIHELP.C
  =========
  (c) Paul Griffiths 1999
  Email: mail@paulgriffiths.net

  CGI helper functions

*/


#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "cgihelp.h"


/*  Forward function declarations  */

void cleanurl(char *str);


/*  Linked list node to hold key/value pairs  */

typedef struct varlist {
    char *key;
    char *value;
    struct varlist *next;
} varlist;

varlist* varstart;


/*  Get all key/value pairs from input  */

int InitInput(int maxbuffer) {
    varlist *var;
    char    *input;


    /*  Allocate memory for input buffer  */

    if ( !(input = malloc(sizeof(char) * maxbuffer)) )
	return ERR_BADMALLOC;
    memset(input, '\0', sizeof(char) * maxbuffer);


    /*  Determine request method and fill input buffer  */
    
    if ( !strcmp(getenv("REQUEST_METHOD"), "GET") )
	strncpy(input, getenv("QUERY_STRING"), maxbuffer - 1);
    else if ( !strcmp(getenv("REQUEST_METHOD"), "POST") )
	fgets(input, maxbuffer, stdin);
    else
	return ERR_BADREQUEST;


    /*  Allocate memory for first key/value pair  */

    if ( ! (varstart = malloc(sizeof(varlist)) ) )
	return ERR_BADMALLOC;
    var = varstart;

    
    /*  Populate key/value pairs  */

    if ( (input = strtok(input, "=")) ) {
	while ( var ) {
	    if ( !(var->key = malloc(sizeof(char) * strlen(input))) )
		return ERR_BADMALLOC;
	    strcpy(var->key, input);
	    cleanurl(var->key);

	    input = strtok(NULL, "&");
	    if ( !(var->value = malloc(sizeof(char) * strlen(input))) )
		return ERR_BADMALLOC;
	    strcpy(var->value, input);
	    cleanurl(var->value);

	    if ( (input = strtok(NULL, "=")) ) {
		if ( !(var->next = malloc(sizeof(varlist))) )
		    return ERR_BADMALLOC;
	    }
	    else {
		var->next = NULL;
	    }
	    var = var->next;
	}
    }	 
    else {

	/*  No key/value pairs in input if we get here  */

	free(varstart);
	varstart = NULL;
    }

    free(input);
    return 0;
}


/*  Retrieves a value from a key  */

char * GetValue(char *key) {
    varlist *var = varstart;
    while ( var ) {
	if ( !strcmp(key, var->key) )
	    return var->value;
	var = var->next;
    }
    return NULL;
}


/*  Retrieves a key using a 1-based index  */

char * GetIndexedKey(int index) {
    int n;
    varlist *var = varstart;
    for ( n = 1; n < index; ++n )
	if ( var->next == NULL )
	    return NULL;
	else
	    var = var->next;
    return var->key;
}


/*  Retrieves a value using a 1-based index  */

char * GetIndexedValue(int index) {
    int n;
    varlist *var = varstart;
    for ( n = 1; n < index; ++n )
	if ( var->next == NULL )
	    return NULL;
	else
	    var = var->next;
    return var->value;
}


/*  Frees memory used by key/value pairs  */

void FreeCGI() {
    varlist *var = varstart;
    while ( var ) {
	free(var->key);
	free(var->value);
	var = var->next;
	free(varstart);
	varstart = var;
    }
}


/*  Cleans up url-encoded string  */
	
void cleanurl(char *str) {
    char asciinum[3] = {0};
    int i = 0, c;
    
    while ( str[i] ) {
	if ( str[i] == '+' )
	    str[i] = ' ';
	else if ( str[i] == '%' ) {
	    asciinum[0] = str[i+1];
	    asciinum[1] = str[i+2];
	    str[i] = strtol(asciinum, NULL, 16);
	    c = i+1;
	    do {
		str[c] = str[c+2];
	    } while ( str[2+(c++)] );
	}
	++i;
    }
}
