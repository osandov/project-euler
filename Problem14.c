#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

#define TEST 1000000
#define TERMS_SIZE (TEST * 10)

static uint64_t *terms;

uint64_t next_collatz(uint64_t n)
{
	if (n % 2)
		return 3 * n + 1;
	else
		return n >> 1;
}

int main(int argc, const char* argv[])
{
	terms = calloc(TERMS_SIZE, sizeof(uint64_t));
	terms[0] = 1;

	uint64_t max = 0, maxi = 0;
	uint64_t i;
	for (i = 0; i < TEST; ++i) {
		uint64_t count = 0;
		uint64_t n = i + 1;
		while (n > TERMS_SIZE || !terms[n - 1]) {
			n = next_collatz(n);
			++count;
		}
		terms[i] = count + terms[n - 1];
		if (terms[i] > max) {
			max = terms[i];
			maxi = i + 1;
			printf("%d: %d\n", maxi, max);
		}
	}

	free(terms);
	return 0;
}
