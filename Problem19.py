def countSundays(year, startsOn):
    count = 0
    daysPerMonth = [31, 29 if isLeap(year) else 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    for i in range(len(daysPerMonth)):
        if startsOn % 7 == 0:
            count += 1
        startsOn += daysPerMonth[i] + 1
    return startsOn, count

def isLeap(year):
    if year % 4 == 0:
        if year % 100 == 0:
            if year % 400 == 0:
                return True
        else:
            return True
    return False

def solve():
    s = 0
    startsOn = 0
    for i in range(1901, 2001):
        startsOn, count = countSundays(i, startsOn)
        s += count
    return s

if __name__ == '__main__':
    print(solve())
