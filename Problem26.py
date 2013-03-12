#~ def cycle(xs):
	#~ n, m = 0, 0
	#~ for l in range(len(xs) / 2, 0, -1):
		#~ for a in range(0, len(xs) - 2 * l + 1):
			#~ if (xs[a:a + l] == xs[a + l:a + 2 * l]):
				#~ if (not (n or m)) or (l <= m - n):
					#~ n, m = a + l, a + 2 * l
	#~ if xs[n:n + len(xs) - m] == xs[m:]:
		#~ return xs[n:m]
	#~ else:
		#~ return []

def cycle(l):
	for a in range(1, len(l) / 2 + 1):
		if l[-a:] == l[-2 * a:-a]:
			for b in range(0, len(l) - a):
				if l[b:b + a] == l[-a:]:
					return l[-a:]
	return []
			

def reciprocal(n, digits):
	l = []
	for i in range(1, digits):
		l.append(int(10**i / n % 10))
	return l

def longestCycle(n, digits):
	maxn, maxc = 0, 0
	for i in range(2, n):
		c = len(cycle(reciprocal(i, digits)))
		#~ print(c)
		if c > maxc:
			maxn = i
			maxc = c
	return maxn, maxc
