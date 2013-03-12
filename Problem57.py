from fractions import Fraction

def digits(x):
    return len(str(x))

def solve(x):
    fraction = Fraction(2)
    count = 0
    for i in range(x):
        fraction = 2 + 1 / fraction
        num = fraction.numerator + fraction.denominator
        den = fraction.numerator
        expansion = 1 + 1 / fraction
        if digits(num) > digits(den):
            count += 1
    return count
