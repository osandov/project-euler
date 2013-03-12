def explore(n, l = []):
    count = 0
    if sum(l) == n:
        return 1
    elif sum(l) < n:
        back = l[-1] + 1 if len(l) else n
        for i in range(1, back):
            count += explore(n, l + [i])
    return count
