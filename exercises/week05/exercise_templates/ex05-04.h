#include <stdio.h>

#define PRINT_RESULT\
  print_result();

extern unsigned result;

static void print_result()
  {
  unsigned mask = 0;
  mask = ~mask ^ (~mask >> 1);
  printf("result = ");
  for(; mask; mask >>=1)
    {
    putchar((result & mask) ? '1' : '0');
    }
  puts("");
  }
