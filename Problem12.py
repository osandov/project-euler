class Solver:
	def __init__(self):
		self.factors = {1 : set([1])}

	def factorize(self, n):
		if n in self.factors:
			return self.factors[n]
		factors = set([1, n])
		for i in range(5, 1, -1):
			if n % i == 0:
				factors.add(i)
				factors.add(n / i)
		nonfactors = set(range(6, n / 6 + 1))
		while len(nonfactors) != 0:
			m = nonfactors.pop()
			if n % m == 0:
				f = self.factorize(m)
				factors |= f
				nonfactors -= f
		self.factors[n] = factors
		return factors

	def solve(self, n):
		triangle = 1
		i = 1
		while len(self.factorize(triangle)) <= n:
			i += 1
			triangle += i
		print(triangle)
			
if __name__ == "__main__":
	s = Solver()
	s.solve(100)
