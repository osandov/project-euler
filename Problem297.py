def gen_fibs(n):
    l = [0, 1]
    a, b = 0, 1
    while b < n:
        a, b = b, a + b
        l.append(b)
    return l

""" Returns the greatest number less than or equal to n """
def search(n, l):
    a, b = 0, len(l) - 1
    while a <= b:
        m = (a + b) / 2
        if l[m] < n:
            a = m + 1
        elif l[m] > n:
            b = m - 1
        else:
            return l[m]
    return l[b]

def zeck(n, fibs):
    c = 0
    while True:
        m = search(n, fibs)
        n -= m
        c += 1
        if n == 0:
            return c

def solve(n):
    fibs = gen_fibs(n)
    c = 0
    for i in xrange(1, n):
        c += zeck(i, fibs)
    return c

if __name__ == '__main__':
    print(solve(10**17))
