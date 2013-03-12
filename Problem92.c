#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#define SOLVE 10000000
#define MAX_DIGITS 8

static uint64_t tens[MAX_DIGITS + 1];
static int *table;

void gen_tens()
{
    int i;
    uint64_t n = 1;
    for (i = 0; i <= MAX_DIGITS; ++i) {
        tens[i] = n;
        n *= 10;
    }
}

int count_digits(uint64_t x)
{
    int i;
    for (i = 0; i < MAX_DIGITS; ++i)
        if (x < tens[i])
            return i;
    return MAX_DIGITS;
}

uint64_t next_link(uint64_t x)
{
    int i;
    int digits = count_digits(x);
    uint64_t n = 0;
    for (i = 0; i < digits; ++i) {
        uint64_t digit = x % tens[i + 1] / tens[i];
        n += digit * digit;
    }
    return n;
}

int arrives(uint64_t x)
{
    if (table[x])
        return table[x];
    else
        return table[x] = arrives(next_link(x));
}

int main(int argc, const char* argv[])
{
    int i, c = 0;
    table = calloc(SOLVE + 1, sizeof(int));
    table[1] = -1;
    table[89] = 1;

    gen_tens();
    for (i = 1; i <= SOLVE; ++i) {
        if (arrives(i) == 1)
            ++c;
    }
    printf("%d\n", c);

    free(table);
    return 0;
}
