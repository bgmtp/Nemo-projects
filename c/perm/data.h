/*
  DATA.H
  ======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Interface to functions for dealing with data
*/


#ifndef PG_DATA_H
#define PG_DATA_H

void InitializeData(unsigned n);
void FreeData(void);
char RemoveItem(unsigned pos);
void InsertItem(char n, unsigned pos);

#endif  /* PG_DATA_H */
