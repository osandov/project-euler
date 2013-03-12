#include <stdio.h>
#include <stdint.h>
#include <math.h>
#define TEST 600851475143

int prime(uint64_t i)
{
	uint64_t k, bound;

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

uint64_t lowest_factor(uint64_t n)
{
	uint64_t i;
	if (!(n % 2))
		return 2;
	for (i = 3; i <= n; i += 2)
		if (!(n % i))
			return i;
}

int main(int argc, const char* argv[])
{
	uint64_t i, n, m;
	n = lowest_factor(TEST);
	m = TEST / n;
	for (i = n; i <= m; ++i) {
		if (!(TEST % (TEST / i)) && prime(TEST / i)) {
			printf("%llu\n", TEST / i);
			return 0;
		}
	}
	return 1;
}
