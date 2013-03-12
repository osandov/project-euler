import Data.Digits

factorial :: Integer -> Integer
factorial x = product [2..x]

solve :: Integer
solve = sum $ filter pred [10..50000]
    where pred x = x == (sum $ map factorial $ digits 10 x)

main :: IO ()
main = putStrLn $ show solve
