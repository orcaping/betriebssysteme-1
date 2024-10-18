#include "ex05-04.h"

unsigned result;
unsigned mask = ~0;

int main()
  {
  mask = mask << (31 - 26);
  mask = mask >> (31 - 26);
  mask = mask >> 3;
  mask = mask << 3;
  result = result | mask;
  PRINT_RESULT

  mask = ~0;
  mask = mask << (31-18);
  mask = mask >> (31-18);
  mask = mask >> 8;
  mask = mask << 8;
  result = ~mask;
  PRINT_RESULT

  mask = ~0;
  mask = mask << (31 - 8);
  mask = mask >> (31 - 8);
  mask = mask >> 0;
  mask = mask << 0;
  result = result & mask;
  PRINT_RESULT

  }
