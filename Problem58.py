from math import sqrt

def isPrime(x):
    for n in range(2, int(sqrt(x)) + 1):
        if x % n == 0:
            return False
    return True

def solve():
    corner = 1
    primes = 0
    total = 1
    delta = 2
    while True:
        for j in range(4):
            corner += delta
            if isPrime(corner):
                primes += 1
            total += 1
        if 10 * primes < total:
            break
        delta += 2
    return delta + 1

if __name__ == '__main__':
    print(solve())
