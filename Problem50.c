#include <stdio.h>
#include <stdint.h>
#include <math.h>

#define TEST 1000000

static uint64_t primes[TEST / 2 + 1];
static int end = 0;
static int is_prime[TEST + 1];

int isPrime(uint64_t i)
{
    uint64_t k, bound;

    if (i == 2 || i == 3)
        return 1;
    if (!(i % 2) || !(i % 3))
        return 0;

    k = 1;
    bound = sqrt(i);
    while (1) {
        uint64_t m = 6 * k - 1, n = 6 * k + 1;
        if (m > bound)
            break;
        if (!(i % m) || !(i % n))
            return 0;
        ++k;
    }

    return 1;
}

void genPrimes()
{
    int i;
    is_prime[0] = is_prime[1] = 0;
    for (i = 2; i <= TEST; ++i) {
        if (isPrime(i)) {
            primes[end] = i;
            is_prime[i] = 1;
            ++end;
        } else
            is_prime[i] = 0;
    }
}

int main(int argc, const char* argv[])
{
    int i, j, k;
    uint64_t max = 1;
    int maxc = 0;
    genPrimes();
    for (i = end; i > 0; --i) {
        for (j = 0; j < i; ++j) {
            uint64_t sum = 0;
            for (k = i - 1; k >= j; --k) {
                if ((sum += primes[k]) > TEST)
                    break;
            }
            if (sum <= TEST) {
                if (is_prime[sum] && (i - j) > maxc) {
                    max = sum;
                    maxc = i - j;
                }
            } else
                j = k;
        }
    }
    printf("%d\n", max);
    return 0;
}
