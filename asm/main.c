#include <inttypes.h>
#include <stdio.h>

uint64_t solve();

int main(int argc, char *argv[])
{
    uint64_t answer;
    answer = solve();
    printf("Answer: %" PRIu64 "\n", answer);
    return 0;
}
