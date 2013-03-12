#include <stdio.h>

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

int main(int argc, const char* argv[])
{
	int array[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
	int i, a, b = 123456789;

	for (i = 1; i < 1000000; ++i) {
		if (next_permutation(array, 10)) {
			printf("Reached end\n");
			break;
		}
	}

	printf("%d%d%d%d%d%d%d%d%d%d\n",
		   array[0], array[1], array[2], array[3], array[4],
		   array[5], array[6], array[7], array[8], array[9]);
}
