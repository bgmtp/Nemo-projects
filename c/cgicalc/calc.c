/*

  CALC.C
  ======
  (c) Paul Griffiths
  Email: mail@paulgriffiths.net

  Simple CGI web-based calculator

*/


#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "cgihelp.h"


/*  Global macros  */

#define ERR_NO_VALUE              (1)
#define ERR_BAD_VALUE             (2)
#define ERR_ZERO_DIVIDE           (3)
#define ERR_BAD_OPERATOR          (4)


/*  main() function  */

int main() {
    int   a, b, result, error = 0;
    char *num1, *num2, *op, *endptr = NULL;


    /*  Output HTML header  */

    printf("Content-Type: text/html\n\n");
    
    printf("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\">\n\n");
    printf("<HTML>\n\n");

    printf("<HEAD>\n");
    printf("    <TITLE>CGI Calculator</TITLE>\n");
    printf("</HEAD>\n\n");

    printf("<BODY>\n\n");
    printf("<H1>CGI Calculator</H1>\n\n");


    /*  Get input and process it  */
    
    if ( InitInput(100) ) {
	printf("<P>ERROR: Problem getting input</P>\n\n");
    }
    else {
	printf("<P>Last result: ");

	num1 = GetValue("number1");
	num2 = GetValue("number2");
	op   = GetValue("operator");
	    
	if ( !num1 && !num2 && !op )
	    printf("No previous calculation.</P>\n\n");
	else {

	    /*  Get first number  */

	    if ( !num1 )
		error = ERR_NO_VALUE;
	    else {
		a = strtol(num1, &endptr, 0);
		if ( *endptr )
		    error = ERR_BAD_VALUE;
	    }


	    /*  Get second number  */

	    if ( !num2 ) 
		error = ERR_NO_VALUE;
	    else {
		b = strtol(num2, &endptr, 0);
		if ( *endptr )
		    error = ERR_BAD_VALUE;
	    }


	    /*  Get operator and calculate result  */

	    if ( !op )
		error = ERR_NO_VALUE;
	    else {
		if ( !strcmp(op, "plus") )
		    result = a + b;
		else if ( !strcmp(op, "minus") )
		    result = a - b;
		else if ( !strcmp(op, "multiplied by") )
		    result = a * b;
		else if ( !strcmp(op, "divided by") )
		    if ( b )
			result = a / b;
		    else
			error = ERR_ZERO_DIVIDE;
		else if ( !strcmp(op, "to the power of") )
		    result = pow(a, b);
		else
		    error = ERR_BAD_OPERATOR;
	    }


	    /*  Check for input errors and output result  */

	    switch ( error ) {
	    case ERR_NO_VALUE:
		printf("Error - one or more values are missing.</P>\n\n");
		break;
		
	    case ERR_BAD_VALUE:
		printf("Error - one or more values was invalid.</P>\n\n");
		break;
		
	    case ERR_ZERO_DIVIDE:
		printf("Error - can't divide by zero.</P>\n\n");
		break;
		
	    case ERR_BAD_OPERATOR:
		printf("Error - invalid operator.</P>\n\n");
		break;
		
	    default:
		printf("%d %s %d = %d</P>\n\n", a, op, b, result);
		break;
	    }
	    
	}

	printf("<BR><HR><BR>\n\n");


	/*  Output calculator form  */

	printf("<FORM ACTION=\"/cgi-bin/calc\" METHOD=\"GET\">\n");
	printf("<TABLE BORDER=\"1\" CELLPADDING=\"10\">\n");
	printf("    <TR>\n");
	printf("        <TH>First number</TH>\n");
	printf("        <TH>Operator</TH>\n");
	printf("        <TH>Second number</TH>\n");
	printf("    </TR>\n\n");
	printf("    <TR>\n");
	printf("        <TD><INPUT TYPE=\"text\" NAME=\"number1\" SIZE=\"8\"></TD>\n");
	printf("        <TD><SELECT NAME=\"operator\">\n");
	printf("            <OPTION>plus</OPTION>\n");
	printf("            <OPTION>minus</OPTION>\n");
	printf("            <OPTION>multiplied by</OPTION>\n");
	printf("            <OPTION>divided by</OPTION>\n");
	printf("            <OPTION>to the power of</OPTION>\n");
	printf("        </SELECT></TD>\n");
	printf("        <TD><INPUT TYPE=\"text\" NAME=\"number2\" SIZE=\"8\"></TD>\n");
	printf("    </TR>\n\n");
	printf("    <TR>\n");
	printf("        <TD COLSPAN=\"3\"><CENTER>");
	printf("<INPUT TYPE=\"submit\" VALUE=\"Calculate!\">");
	printf("</CENTER></TD>\n");
	printf("    </TR>\n");
	printf("</TABLE>\n");
	printf("</FORM>\n\n");

	printf("</BODY>\n\n</HTML>\n");
    }


    /*  Clean up and exit  */
 
    FreeCGI();
    return EXIT_SUCCESS;
}
