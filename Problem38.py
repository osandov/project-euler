from itertools import permutations

def check(x, n):
    first = int(x[:n])
    x = x[n:]
    i = 2
    while True:
        if len(x) == 0:
            return True
        s = str(first * i)
        n = len(s)
        i += 1
        if x[:n] != s:
            return False
        x = x[n:]

def solve():
    for perm in permutations("987654321"):
        for i in range(1, 9):
            s = ''.join(perm)
            if check(s, i):
                return int(s)

if __name__ == '__main__':
    print(solve())
