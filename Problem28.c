#include <stdio.h>

int main(int argc, const char* argv[])
{
	int n = 1001;
	int i, r = 1;
	for (i = 2; i <= (n + 1) / 2; ++i)
		r += 16 * i * i - 28 * i + 16;
	printf("%d\n", r);
}
