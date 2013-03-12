def sumOfProperDivisors(x):
    if x == 1:
        return [1]
    l = [1]
    for i in range(2, x / 2 + 1):
        if x % i == 0:
            l.append(i)
    return sum(l)

def solve(x):
    l = [0] 
    s = 0
    for i in range(1, x):
        l.append(sumOfProperDivisors(i))
        if l[i] < i and l[l[i]] == i: 
            s += i
            s += l[i]
    return s

if __name__ == '__main__':
    print(solve(10000))
