#include "ex05-04.h"

unsigned result;
unsigned bit;

int main()
  {
  bit = 7;
  result = result | 1 << bit;
  PRINT_RESULT

  bit = 13;
  result = 4242;
  result = result & 1 << bit;
  PRINT_RESULT

  bit = 12;
  result = 4221;
  result = result & ~(1 << bit);
  PRINT_RESULT
  }
