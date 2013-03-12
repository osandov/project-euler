def solve():
    triangle = 1
    pentagonal = 1
    hexagonal = 1
    i = 1
    ip = 1
    ih = 1
    d = False
    while True:
        i += 1
        triangle += i
        if triangle == pentagonal and triangle == hexagonal:
            if d:
                return triangle
            else:
                d = True
        if triangle > pentagonal:
            ip += 1
            pentagonal = ip * (3 * ip - 1) / 2
        if triangle > hexagonal:
            ih += 1
            hexagonal = ih * (2 * ih - 1)

if __name__ == '__main__':
    print(solve())
