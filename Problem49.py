from bisect import insort
from itertools import permutations
from math import sqrt

def sieve(n, m = 0):
    l = [True] * n
    primes = []
    for i in range(2, int(sqrt(n))):
        if l[i]:
            if i > m:
                primes.append(i)
            for j in range(i * i, n, i):
                l[j] = False
    for i in range(int(sqrt(n)), n):
        if l[i] and i > m:
            primes.append(i)
    return primes

def contains(a, x):
    for n in a:
        if n == x:
            return True
        elif n > x:
            break
    return False

def solve():
    primes = sieve(10000, 1000)
    for x in primes:
        digits = sorted(str(x))
        perms = []
        triples = []
        for perm in permutations(digits):
            x = int(''.join(perm))
            if x < 1000:
                continue
            if not contains(perms, x) and contains(primes, x):
                perms.append(x)
        n = len(perms)
        for x in range(0, n - 2):
            X = perms[x]
            for y in range(x + 1, n - 1):
                Y = perms[y]
                for z in range(y + 1, n):
                    Z = perms[z]
                    if Y - X == Z - Y:
                        m = X * 10 ** 8 + Y * 10 ** 4 + Z
                        if m != 148748178147:
                            return m

if __name__ == '__main__':
    print(solve())
