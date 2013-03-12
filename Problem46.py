from math import sqrt

""" Variation of the Sieve of Eratosthenes which returns a tuple containing
a list of primes and a list of odd composites """
def sieve(n):
    l = [True] * ((n / 2) - 1)
    primes = [2]
    composites = []
    for i in range(0, len(l)):
        if l[i]:
            k = 2 * i + 3
            primes.append(k)
            for j in range((k * k - 3) / 2, n / 2 - 1, k):
                if l[j]:
                    composites.append(2 * j + 3)
                    l[j] = False
    return primes, sorted(composites)

def twice_squares(n):
    l = [False] * n
    i = 1
    while True:
        x = 2 * i * i
        if x >= n:
            return l
        l[x] = True
        i += 1

def solve():
    primes, odds = sieve(10000)
    squares = twice_squares(10000)
    for n in odds:
        for m in primes:
            if m > n:
                return n
            if squares[n - m]:
                break

if __name__ == '__main__':
    print(solve())
