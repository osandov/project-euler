AMB = 0
INC = 1
DEC = 2
BNC = 3

def solve(percent):
    percent *= 0.01
    bouncy = {}
    bouncy_count = 0
    bouncy['00'] = AMB
    for i in range(1, 10):
        bouncy['0' + str(i)] = INC
    for i in range(10, 100):
        c = cmp(i / 10, i % 10)
        if c < 0:
            bouncy[str(i)] = INC
        elif c > 0:
            bouncy[str(i)] = DEC
        else:
            bouncy[str(i)] = AMB
    while bouncy_count / float(i) < percent:
        i += 1
        s = str(i)
        s1 = s[1:]
        v = bouncy[s1]
        if v == AMB:
            c = cmp(s[0], s1[0])
            if c < 0:
                bouncy[s] = INC
            elif c > 0:
                bouncy[s] = DEC
            else:
                bouncy[s] = AMB
        elif v == INC:
            c = cmp(s[0], s1[0])
            if c <= 0:
                bouncy[s] = INC
            else:
                bouncy[s] = BNC
                bouncy_count += 1
        elif v == DEC:
            c = cmp(s[0], s1[0])
            if c >= 0:
                bouncy[s] = DEC
            else:
                bouncy[s] = BNC
                bouncy_count += 1
        else:
            bouncy[s] = BNC
            bouncy_count += 1
    print(i)
