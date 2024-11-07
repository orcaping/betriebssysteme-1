#include "ex06-05.test.h"

int main()
{
    int i = 0;

    *(&res + i) = *(&op1 + i) & *(&op2 + i);
    ++i;
    *(&res + i) = *(&op1 + i) & *(&op2 + i);
    ++i;
    *(&res + i) = *(&op1 + i) & *(&op2 + i);
    ++i;
    *(&res + i) = *(&op1 + i) & *(&op2 + i);
    ++i;
    *(&res + i) = *(&op1 + i) & *(&op2 + i);
    ++i;
    *(&res + i) = *(&op1 + i) & *(&op2 + i);
    ++i;
    *(&res + i) = *(&op1 + i) & *(&op2 + i);
    ++i;
    *(&res + i) = *(&op1 + i) & *(&op2 + i);

    CHECK_RESULT
}
