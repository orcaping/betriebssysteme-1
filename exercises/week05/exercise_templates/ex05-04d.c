#include "ex05-04.h"

unsigned result;
unsigned mask = ~0;
unsigned upper_bound;
unsigned lower_bound;

int main()
  {
  upper_bound = 26;
  lower_bound = 3;
  mask = mask << (31 - upper_bound);
  mask = mask >> (31 - upper_bound);
  mask = mask >> lower_bound;
  mask = mask << lower_bound;
  result = result | mask;
  PRINT_RESULT

  mask = ~0;
  upper_bound = 18;
  lower_bound = 8;
  mask = mask << (31-upper_bound);
  mask = mask >> (31-upper_bound);
  mask = mask >> lower_bound;
  mask = mask << lower_bound;
  result = ~mask;
  PRINT_RESULT

  mask = ~0;
  upper_bound = 8;
  lower_bound = 0;
  mask = mask << (31 - upper_bound);
  mask = mask >> (31 - upper_bound);
  mask = mask >> lower_bound;
  mask = mask << lower_bound;
  result = result & mask;
  PRINT_RESULT

  }
