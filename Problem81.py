from __future__ import print_function

SIZE = 3
RIGHT = 1
DOWN = 2

l = []
d = []
for i in range(SIZE):
    d.append([0] * SIZE)
f = file('matrix2.txt')

for line in f.readlines():
    l.append([int(x) for x in line.split(',')])

def get_n(x, y):
    return l[y][x]

def get_dir(x, y):
    return d[y][x]

def set_dir(x, y, v):
    d[y][x] |= v

for x in range(SIZE - 1):
    for y in range(SIZE - 1):
        if get_n(x + 1, y) < get_n(x, y + 1):
            set_dir(x, y, RIGHT)
            set_dir(x + 1, y, DOWN)
        else:
            set_dir(x, y, DOWN)
            set_dir(x, y + 1, RIGHT)

for i in range(SIZE - 1):
    set_dir(SIZE - 1, i, DOWN)
    set_dir(i, SIZE - 1, RIGHT)

for y in range(SIZE):
    s = '\n'
    for x in range(SIZE):
        dir = get_dir(x, y)
        print('{:^4}'.format(get_n(x, y)), end=('-' if dir & RIGHT else ' '))
        s += '  |  ' if dir & DOWN else '     '
    print(s)
