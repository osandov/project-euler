def solve(n):
	return len(set([x**y for x in range(2, n + 1) for y in range (2, n + 1)]))

if __name__ == "__main__":
	print(solve(100))
