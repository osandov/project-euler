import math

s = '1_2_3_4_5_6_7_8_9_0'
s2 = s[::2]

min = int(s.replace('_', '0'))
max = int(s.replace('_', '9'))

min_root = int(math.sqrt(min))
max_root = int(math.sqrt(max))

for i in range(min_root, max_root, 10):
    s3 = str(i * i)[::2]
    if s2 == s3:
        print(i)
        break
