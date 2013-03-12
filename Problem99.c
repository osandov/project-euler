#include <stdio.h>
#include <math.h>

int main(int argc, char **argv)
{
    FILE *file = fopen("problem99.txt", "r");
    if (!file)
        return 1;
    int line = 1;
    double max = 0.0;
    int max_line = 0;
    do {
        int base, exp;
        fscanf(file, "%d,%d", &base, &exp);
        if (feof(file))
            break;
        double ln = exp * log(base);
        if (ln > max) {
            max = ln;
            max_line = line;
        }
        ++line;
    } while (1);
    printf("%d\n", max_line);
    fclose(file);
    return 0;
}
