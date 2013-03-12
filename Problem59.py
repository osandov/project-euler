import string

def loadCipher(filename):
    f = open(filename, "r")
    s = f.read()
    f.close()
    l = []
    while True:
        match = s.find(',')
        if match == -1:
            return l
        l.append(int(s[:match]))
        s = s[match + 1:]

def readData(l):
    return ''.join([chr(x) for x in l])

def decipher(l, key):
    m = []
    for i in range(len(l)):
        r = l[i] ^ key[i % 3]
        if r < 0x20:
            return None
        m.append(r)
    return m

def bruteForce(l):
    keys = [[ord(a), ord(b), ord(c)] for a in string.lowercase for b in string.lowercase for c in string.lowercase] 
    m = []
    for key in keys:
        d = decipher(l, key)
        if d:
            m.append(readData(d))
    return m
