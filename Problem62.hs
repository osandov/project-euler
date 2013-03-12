import Data.List
import Data.Digits

isCube :: Integer -> Bool
isCube x = (round (fromIntegral x ** (1/3))) ^ 3 == x

perm :: Integer -> [Integer]
perm x = map (unDigits 10) $ permutations (digits 10 x)

solve :: Integer
solve = head $ filter pred $ map (^3) [1..]
    where pred x = 3 == (length $ filter isCube $ perm x)
