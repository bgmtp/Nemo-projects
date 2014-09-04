CC=gcc
CARGS=-c -O3 -ansi -pedantic -Wall

array: perm.o data_array.o stack_array.o cmdline.o
	$(CC) -o perm perm.o data_array.o stack_array.o cmdline.o

list: perm.o data_list.o stack_list.o cmdline.o
	$(CC) -o perm perm.o data_list.o stack_list.o cmdline.o

perm.o: perm.c data.h stack.h cmdline.h
	$(CC) -o perm.o perm.c $(CARGS)

data_array.o: data_array.c data.h
	$(CC) -o data_array.o data_array.c $(CARGS)

data_list.o: data_list.c data.h
	$(CC) -o data_list.o data_list.c $(CARGS)

stack_array.o: stack_array.c stack.h
	$(CC) -o stack_array.o stack_array.c $(CARGS)

stack_list.o: stack_list.c stack.h
	$(CC) -o stack_list.o stack_list.c $(CARGS)

cmdline.o: cmdline.c cmdline.h
	$(CC) -o cmdline.o -c cmdline.c $(OPTS)

