langtest: langtest.o list.o
	gcc -o langtest langtest.o list.o -Wall

langtest.o: langtest.c list.h
	gcc -o langtest.o langtest.c -c -ansi -pedantic -Wall

list.o: list.c list.h
	gcc -o list.o list.c -c -ansi -pedantic -Wall

