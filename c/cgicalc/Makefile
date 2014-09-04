calc      : calc.o cgihelp.o
	cc -o /home/httpd/cgi-bin/calc calc.o cgihelp.o -lm

calc.o    : calc.c cgihelp.h
	cc -o calc.o calc.c -c

cgihelp.o : cgihelp.c cgihelp.h
	cc -o cgihelp.o cgihelp.c -c


