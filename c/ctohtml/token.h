/*
  TOKEN.H
  =======
  (c) Copyright Paul Griffiths 2000
  Email: mail@paulgriffiths.net

  Interface to utilities for finding a string token
*/


#ifndef PG_TOKEN_H
#define PG_TOKEN_H

#include "process.h"

int IsToken(const char * token, enum tokens tokentype);

#endif  /* PG_TOKEN_H */
