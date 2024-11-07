#include "ex06-05.test.h"

int main()
{
    for (int i = 0; i < 8; ++i) {
        *(&res + i) = *(&op1 + i) & *(&op2 + i);
    }

    CHECK_RESULT
}
