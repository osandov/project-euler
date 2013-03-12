#include <stdio.h>
#include <math.h>

int next_permutation(int *a, int n)
{
	int i, j, k;
	for (i = n - 2; i >= 0; --i) {
		if (a[i] < a[i + 1])
			break;
	}
	if (i < 0)
		return -1;

	for (j = n - 1; j > i; --j) {
		if (a[i] < a[j])
			break;
	}

	k = a[i];
	a[i] = a[j];
	a[j] = k;

	j = i + 1;
	k = n - 1;
	while (k - j > 0) {
		i = a[j];
		a[j] = a[k];
		a[k] = i;
		++j;
		--k;
	}
	return 0;
}

int array_to_int(int *a, int n)
{
	int i, j, r = 0;
	for (i = 1; i <= n; ++i) {
		int d = a[n - i];
		for (j = 1; j < i; ++j)
			d *= 10;
		r += d;
	}
	return r;
}

int is_prime(int i)
{
	int k, bound;

	if (!(i % 2) || !(i % 3))
		return 0;

	k = 1;
	bound = sqrt(i);
	while (1) {
		int m = 6 * k - 1, n = 6 * k + 1;
		if (m > bound)
			break;
		if (!(i % m) || !(i % n))
			return 0;
		++k;
	}

	return 1;
}

int main(int argc, const char* argv[])
{
	int array[9];
	int i, j, max = 0;
	for (i = 2; i <= 9; ++i) {
		for (j = 0; j < i; ++j)
			array[j] = j + 1;
		while (!next_permutation(array, i)) {
			int n = array_to_int(array, i);
			if (is_prime(n))
				max = n;
		}
	}
	printf("%d\n", max);
	return 0;
}
