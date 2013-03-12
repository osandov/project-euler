solve :: Integer -> Integer
solve x = sum $ filter pred $ init [1..x]
    where pred x = (x `mod` 3 == 0) || (x `mod` 5 == 0)

main :: IO ()
main = putStrLn $ show (solve 1000)
