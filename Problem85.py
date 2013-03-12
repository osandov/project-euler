import math

# sum [1..x]
def f(x):
    return (x * (x + 1)) / 2

# can x be expressed in the form (n * (n + 1)) / 2 for some n?
def f1(x):
    det = 1 + 8 * x
    root = int(math.sqrt(det))
    if (root * root == det) and (root - 1) % 2 == 0:
        return (root - 1) / 2
    else:
        return None

low = 2000000 - 1000
hi = 2000000 + 1000

# What is the smallest number n in [lo..hi] which is a multiple of x and
# satisfies f1(n / x)
def g(x):
    m = None
    i = None
    d = 1000
    for n in range(low, hi + 1):
        if n % x == 0:
            inv = f1(n / x)
            if inv:
                diff = abs(2000000 - n)
                if diff < d:
                    m = n
                    i = inv
                    d = diff
    return (m, i)

def solve():
    j = 1
    s = 1
    d = 1000
    ret = None
    while j < 100:
        m, i = g(s)
        if m:
            diff = abs(2000000 - m)
            if diff < d:
                d = diff
                ret = i * f1(s)
        j += 1
        s += j
    return ret
