def modpow(base, power, modulus):
    result = 1
    base %= modulus
    while power > 0:
        if power % 2 == 0:
            power /= 2
            base = (base * base) % modulus
        else:
            result = (result * base) % modulus
            power -= 1
    return result

def solve():
    return modpow(2, 7830457, 10000000000) * 28433 % 10000000000 + 1

if __name__ == '__main__':
    print(solve())
