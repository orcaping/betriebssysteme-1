#include "ex06-06.test.h"

int main()
{
    for (int i = 0; i < number_of_quadwords; ++i) {
      *(&res + i) = *(&op1 + i) & *(&op2 + i);
    }

    CHECK_RESULT
}
