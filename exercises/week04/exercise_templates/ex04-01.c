#define XYZ 1.2
#define ABC XYZ \
+\
1e+03

#include <stdio.h>

int main (int argc, char**argv)
{
    printf ("Es wurden %i Argumente uebergeben\n", argc);
    printf ("ABC ist %f\n", ABC);
    return (int) ABC;
}
