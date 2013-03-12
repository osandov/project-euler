import Data.List
import Data.Maybe

isPrime n = n > 1 &&
    foldr (\p r -> p*p > n || ((n `rem` p) /= 0 && r)) True primes

primes = 2 : filter isPrime [3, 5..]

primeFactors n | n > 1 = go n primes
    where
      go n ps@(p:ps')
        | p * p > n      = [n]
        | n `rem` p == 0 = p : go (n `quot` p) ps
        | otherwise      = go n ps'

solve x = head $ fromJust $ find predicate xs
    where xs = map (take x) (tails [2..])
          predicate xs = distincts xs == (take x $ repeat x)
          distincts xs = map (length . nub . primeFactors) xs

