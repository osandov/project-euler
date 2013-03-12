def sumOfProperDivisors(x):
    if x == 1:
        return 0
    l = [1]
    for i in range(2, x / 2 + 1):
        if x % i == 0:
            l.append(i)
    return sum(l)

def isAbundant(x):
    return x < sumOfProperDivisors(x)

def solve():
    l = [False]
    s = 0
    for i in range(1, 28124):
        l.append(isAbundant(i))
    for i in range(1, 28124):
        for j in range(1, i / 2 + 1):
            if l[j] and l[i - j]:
                break
        else:
           print(i)
           s += i
    return s

if __name__ == '__main__':
    print(solve())
