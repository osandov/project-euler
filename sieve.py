from math import sqrt

class Sieve:
    def __init__(self, n):
        self.n = n
        self.l = [True] * ((n - 1) / 2)
        bound = self.n / 2 - 1
        for i in range(3, int(sqrt(n)) + 1, 2):
            for j in range((i * i - 3) / 2, bound, i):
                self.l[j] = False

    def is_prime(self, n):
        if n < 3:
            return n == 2
        elif n % 2:
            return self.l[(n - 3) / 2]
        else:
            return False

    def list(self):
        l = [2]
        i = 3
        for v in self.l:
            if v:
                l.append(i)
            i += 2
        return l
