def numeral1(x):
    return ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'][x]

def numeral2(x):
    if x / 10 == 0:
        return numeral1(x)
    tens = ['', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'][x / 10]
    if tens == 'ten':
        return ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'][x % 10]
    if x % 10 != 0:
        tens += numeral1(x % 10)
    return tens

def numeral3(x):
    if x / 100 == 0:
        return numeral2(x)
    hundreds = numeral1(x / 100) + 'hundred'
    if x % 100 != 0:
        hundreds += 'and' + numeral2(x % 100)
    return hundreds

def numeral(x):
    if x == 1000:
        return 'onethousand'
    return numeral3(x)

def solve():
    return sum([len(numeral(x)) for x in range(1, 1001)])

if __name__ == '__main__':
    print(solve())
