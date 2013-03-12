def count(n):
    r = 0
    for a in range(1, n - 1):
        a2 = a * a
        for b in range(a, n - 1):
            c = n - (a + b)
            if a2 + b * b == c * c:
                r += 1
    return r

def solve(x):
    maxi, maxn = 0, 0
    for i in range(1, x + 1):
        n = count(i)
        if n > maxn:
            maxi, maxn = i, n
    return maxi

if __name__ == '__main__':
    print(solve(1000))
