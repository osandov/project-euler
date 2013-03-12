def _solve(coins, target, total, l):
    r = 0
    if total == target:
        return 1
    elif total < target:
        back = l[-1] if len(l) else 0
        for c in coins:
            if c >= back:
                r += _solve(coins, target, total + c, l + [c])
    return r

def solve(coins, target):
    return _solve(coins, target, 0, [])

if __name__ == '__main__':
    print(solve([1, 2, 5, 10, 20, 50, 100, 200], 200))
