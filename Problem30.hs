import Data.Digits

f :: Integer -> Integer
f x = sum $ map (^5) $ digits 10 x

solve :: Integer
solve = sum $ filter (\x -> x == f x) [2..bound]
    where bound = 10 ^ (head $ dropWhile (\x -> x * 9^5 > 10^x) [1..]) - 1

main :: IO ()
main = putStrLn $ show solve
