import math

def isPentagonal(x):
    n = (math.sqrt(24 * x + 1) + 1) / 6
    return n == math.floor(n)

def solve():
    l = [1]
    while True:
        n = l[-1] + 3 * (len(l) + 1) - 2
        l.append(n)
        for m in l[:len(l) - 1]:
            if isPentagonal(n - m) and isPentagonal(n + m):
                return n - m

if __name__ == '__main__':
    print(solve())
