/*

  LANGTEST.C
  =======
  (c) Paul Griffiths 1999
  Email: paulgriffiths@mcmail.com

  Simple foreign language phrase tester

*/


#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <time.h>
#include "list.h"


/*  Forward function declarations  */

int GetInput(int argc, char *argv[]);
int Rndm(int lower, int higher);
int Getline(char *buffer, int maxlen, FILE *fp);

/*  Global variable to hold the names of the two languages  */

char langs[2][MAX_LINE];


/*  main()  */

int main(int argc, char *argv[]) {

    int   nPhrases, q, lang1, lang2;
    char *phrase[2], buffer[MAX_LINE] = {0};


    /*  Seed random number generator  */

    srand( (unsigned) time(NULL) );

    
    /*  Get input from files, and store number of phrases  */

    nPhrases = GetInput(argc, argv);


    /*  Loop until the user types 'q' or 'Q'  */

    while ( buffer[0] != 'q' && buffer[0] != 'Q' ) {


	/*  Pick a random phrase  */

	q = Rndm(0, nPhrases-1);

	
	/*  Decide which language to test  */

	lang1 = Rndm(0, 1);
	lang2 = lang1 ? 0 : 1;


	/*  Get the relevant phrase, and ask question  */

	GetItem(q, &phrase[0], &phrase[1]);
	printf("The %s is %s\n", langs[lang1], phrase[lang1]);
	printf("Enter the %s: ", langs[lang2]);
	fgets(buffer, MAX_LINE-1, stdin);
	printf("The %s is %s\n\n", langs[lang2], phrase[lang2]);
    }

    
    /*  Clean up nicely and exit  */

    FreeList();
    return EXIT_SUCCESS;
}


/*  Gets phrases from specified data files  */

int GetInput(int argc, char *argv[]) {

    int   i, a = 1, length = 0;
    FILE *fp;
    char  buffer1[MAX_LINE], buffer2[MAX_LINE];


    /*  Loop through input files specified
	as command line arguments           */

    while ( argv[a] ) {
	if ( ! (fp = fopen(argv[a], "r")) ) {
	    printf("LANGTEST: Error opening %s for reading...", argv[a]);
	    printf("skipping\n");
	    continue;
	}

	/*  Determine the two languages used from
	    first two lines in the data file       */

	for ( i = 0; i < 2; i++ ) {
	    if (Getline(buffer1, sizeof(langs[0])/sizeof(langs[0][0])-1, fp)) {
		Trim(buffer1);
		strcpy(langs[i], buffer1);
	    }
	    else {
		printf("LANGTEST: Error determining languages.\n");
		exit(EXIT_FAILURE);
	    }
	}
	
	
	/*  Get pairs of input lines until we have
	    no more pairs left in this file         */
	    
	while ( Getline(buffer1, MAX_LINE-1, fp) ) {
	    if ( Getline(buffer2, MAX_LINE-1, fp) ) {
		Trim(buffer1);
		Trim(buffer2);

		
		/*  Add both phrases to list  */

		if ( AppendItem(buffer1, buffer2) ) {
		    printf("LANGTEST: Failed to allocate item.\n");
		    exit(EXIT_FAILURE);
		}
		++length;
	    }
	    else
		break;
	}

	++a;
	fclose(fp);
    }
    return length;
}


/*  Wrapper function to get a random number -
    rand() % n; is not very random, especially
    with the lower order bits.                  */

int Rndm(int lower, int higher) {

    int range = higher - lower + 1;

    return lower + (int)((double) rand() / ((double)RAND_MAX + 1) * range);
}


/*  Wrapper around fgets(), so we can handle comments
    (lines that start with '#') and blank lines.       */

int Getline(char *buffer, int maxlen, FILE *fp) {

    char *temp;


    /*  Loop until we have an acceptable line  */

    do {

	/*  Exit on error  */
	
	if ( !fgets(buffer, maxlen, fp) )
	    return 0;
	temp = buffer;

	
	/*  Find first non-whitespace character  */

	while ( *temp && isspace(*temp) )
	    ++temp;


	/*  Continue loop if we have a comment or a blank line  */

    } while ( *temp == 0 || *temp == '#' );

    return 1;
}
	
