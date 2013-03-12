import Data.List
import Data.Digits

subdiv :: Integer -> Bool
subdiv x = f 2 2 && f 3 3 && f 4 5 && f 5 7 && f 6 11 && f 7 13 && f 8 17
    where f n m = (sub n) `mod` m == 0
          sub n = (x `div` (10 ^ (8 - n))) `mod` 1000

pandigitals :: [Integer]
pandigitals = map (unDigits 10) (permutations [0..9])

solve :: Integer
solve = sum $ filter subdiv pandigitals

main :: IO ()
main = putStrLn (show solve)
