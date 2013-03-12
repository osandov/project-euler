def isPalindrome(s):
	return s == s[::-1]

def solve(n):
	r = 0
	for i in range(1, n):
		if isPalindrome(str(i)) and isPalindrome(bin(i)[2:]):
			r += i
	return r

if __name__ == '__main__':
	print(solve(1000000))
