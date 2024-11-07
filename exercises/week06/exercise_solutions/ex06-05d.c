#include "ex06-05.test.h"

int main()
{
    unsigned long long *res_addr = &res;
    unsigned long long *op1_addr = &op1;
    unsigned long long *op2_addr = &op2;

    while (res_addr != &res + 8) {
        *res_addr = *op1_addr & *op2_addr;
        ++res_addr;
        ++op1_addr;
        ++op2_addr;
    }

    CHECK_RESULT
}
