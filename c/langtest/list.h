/*

  LIST.H
  ======
  (c) Paul Griffiths, 1999
  Email: mail@paulgriffiths.net

  Interface to linked list operations

*/


#ifndef PG_LIST_H
#define PG_LIST_H


/*  Global macros  */

#define MAX_LINE              (100)


/*  Function declarations  */

int AppendItem(char *foreign, char *english);
int FreeList();
int GetItem(int index, char **phrase1, char **phrase2);
int Trim(char *buffer);


#endif  /*  PG_LIST_H  */
