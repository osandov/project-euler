from itertools import product

def get_dice():
    pyramidal_freq = [0] * 37
    cubic_freq = [0] * 37
    pyramidal = []
    cubic = []

    for roll in product(range(1, 5), repeat=9):
        pyramidal_freq[sum(roll)] += 1

    for i in range(len(pyramidal_freq)):
        for j in range(pyramidal_freq[i]):
            pyramidal.append(i)

    for roll in product(range(1, 7), repeat=6):
        cubic_freq[sum(roll)] += 1

    for i in range(len(cubic_freq)):
        for j in range(cubic_freq[i]):
            cubic.append(i)
    return pyramidal, cubic

def solve():
    pyramidal, cubic = get_dice()
    total = 0
    pyramid_win = 0

    for p in pyramidal:
        for c in cubic:
            total += 1
            if p > c:
                pyramid_win += 1
    return float(pyramid_win) / float(total)

if __name__ == '__main__':
    print('{:.7}'.format(solve()))
