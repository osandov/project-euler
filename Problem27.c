#include <stdint.h>
#include <stdio.h>
#include <math.h>

#define SOLVE 1000

int64_t is_prime(int64_t x)
{
    int64_t k, bound;

	if (!(x % 2) || !(x % 3))
		return 0;

	k = 1;
	bound = sqrt(abs(x));
	while (1) {
		int64_t m = 6 * k - 1, n = 6 * k + 1;
		if (m > bound)
			break;
		if (!(x % m) || !(x % n))
			return 0;
		++k;
	}

	return 1;
}

int main(int argc, const char* argv[])
{
    int64_t a, b;
    int64_t maxa = 0, maxb = 0, maxc = 0;
    for (a = -SOLVE + 1; a < SOLVE; ++a) {
        for (b = -SOLVE + 1; b < SOLVE; ++b) {
            int64_t x = 0, c = 0;
            while (is_prime(x * x + a * x + b)) {
                ++x;
                ++c;
            }
            if (c > maxc) {
                maxa = a;
                maxb = b;
                maxc = c;
            }
        }
    }
    printf("%d * %d = %d for %d\n", maxa, maxb, maxa * maxb, maxc);
    return 0;
}
