#include <stdio.h>

int contains(int x1, int y1, int x2, int y2, int x3, int y3)
{
    double det, lambda1, lambda2, lambda3;
    det = 1.0 / ((y2 - y3) * (x1 - x3) + (x3 - x2) * (y1 - y3));
    lambda1 = det * ((y2 - y3) * (-x3) + (x3 - x2) * (-y3));
    if (lambda1 <= 0.0 || lambda1 >= 1.0)
        return 0;
    lambda2 = det * ((y3 - y1) * (-x3) + (x1 - x3) * (-y3));
    if (lambda2 <= 0.0 || lambda2 >= 1.0)
        return 0;
    lambda3 = 1.0 - lambda1 - lambda2;
    return lambda3 > 0.0 && lambda3 < 1.0;
}

int main(int argc, char **argv)
{
    FILE *file = fopen("problem102.txt", "r");
    if (!file)
        return 1;
    int c = 0;
    do {
        int x1, y1, x2, y2, x3, y3;
        fscanf(file, "%d,%d,%d,%d,%d,%d", &x1, &y1, &x2, &y2, &x3, &y3);
        if (feof(file))
            break;
        c += contains(x1, y1, x2, y2, x3, y3);
    } while (1);
    printf("%d\n", c);
    return 0;
}
