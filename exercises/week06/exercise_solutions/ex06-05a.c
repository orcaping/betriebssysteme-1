#include "ex06-05.test.h"

int main()
{
    *(&res + 0) = *(&op1 + 0) & *(&op2 + 0);
    *(&res + 1) = *(&op1 + 1) & *(&op2 + 1);
    *(&res + 2) = *(&op1 + 2) & *(&op2 + 2);
    *(&res + 3) = *(&op1 + 3) & *(&op2 + 3);
    *(&res + 4) = *(&op1 + 4) & *(&op2 + 4);
    *(&res + 5) = *(&op1 + 5) & *(&op2 + 5);
    *(&res + 6) = *(&op1 + 6) & *(&op2 + 6);
    *(&res + 7) = *(&op1 + 7) & *(&op2 + 7);

    CHECK_RESULT
}
