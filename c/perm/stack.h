/*
  STACK.H
  =======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Interface to stack operations
*/


#ifndef PG_STACK_H
#define PG_STACK_H

void InitializeStack(void);
void Push(char n);
char Pop(void);
void PrintStack(void);

#endif  /* PG_STACK_H */
