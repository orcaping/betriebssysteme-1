#include "ex05-04.h"

unsigned result;

int main()
  {
  result = result | 1 << 7;
  PRINT_RESULT

  result = 4242;
  result = result & 1 << 13;
  PRINT_RESULT

  result = 4221;
  result = result & ~(1 << 12);
  PRINT_RESULT
  }
