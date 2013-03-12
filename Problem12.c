#include <stdio.h>
#include <math.h>

#define TEST 500

int divisors(int x)
{
    int root = sqrt(x);
    int i, c = (x == root * root) ? 1 : 2;
    for (i = 2; i <= root; ++i) {
        if (x % i == 0)
            c += 2;
    }

    return c;
}

int main(int argc, const char* argv[])
{
    int i, triangle = 1;
    for (i = 2; divisors(triangle) <= TEST; ++i)
        triangle += i;
    printf("%d\n", triangle);
    return 0;
}
