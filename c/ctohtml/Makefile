CC=gcc
LARGS=
CARGS=-O3 -c -ansi -pedantic -Wall

ctohtml: main.o file.o process.o html.o token.o
	$(CC) -o ctohtml main.o file.o process.o html.o token.o $(LARGS)

main.o: main.c file.h process.h html.h
	$(CC) -o main.o main.c $(CARGS)

file.o: file.c file.h
	$(CC) -o file.o file.c $(CARGS)

process.o: process.c process.h html.h token.h
	$(CC) -o process.o process.c $(CARGS)

html.o: html.c html.h
	$(CC) -o html.o html.c $(CARGS)

token.o: token.c token.h process.h
	$(CC) -o token.o token.c $(CARGS)

