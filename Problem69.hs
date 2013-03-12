{- Naive implementation of the totient function -}
phi :: Int-> Int
phi x = length $ filter (\y -> gcd x y == 1) [1..x - 1]

{- We empircally determined that the max phi in [1, 5] is 2, in [1, 10]
 - is 6, in [1, 100] is 30, in [1, 1000] is 210, etc. Essentially, the first n
 - primes multiplied together -}
