from sieve import Sieve

def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

def naive(n):
    c = 1
    for m in range(2, n):
        if gcd(n, m) == 1:
            c += 1
    return c

def solve(n):
    l = [0] * n
    for i in range(1, n + 1):
        if not l[i - 1]:
            coprimes = []
            for j in range(2, i):
                if gcd(i, j) == 1:
                    coprimes.append(j)
            l[i - 1] = 1 + len(coprimes)
            for c in coprimes:
                if i * c > n:
                    break
                l[(i * c) - 1] = l[i - 1] * l[c - 1]
    return l

s = Sieve(10 ** 7)
ps = s.list()

def phi(n):
    if n < 2:
        return 1
     
    if s.is_prime(n):
        return n - 1
     
    if (n & 1) == 0:
        m = n >> 1
        return phi(m) if m & 1 else phi(m) << 1
     
    for p in ps:
        if p > n:
            break
        if not n % p:
            o = n / p
            d = gcd(p, o)
            return phi(p) * phi(o) if d == 1 else phi(p) * phi(o) * d / phi(d)

def is_perm(n, m):
    n = str(n)
    m = str(m)
    return len(n) == len(m) and sorted(n) == sorted(m)

def solve():
    minr = float(87109) / float(phi(87109))
    minn = 87109
    for n in range(2, 10**7):
        m = phi(n)
        if is_perm(n, m):
            r = float(n) / float(m)
            if r < minr:
                minn = n
                minr = r
    return minn
