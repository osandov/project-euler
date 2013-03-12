digitalSum :: Integer -> Integer
digitalSum x = sum $ map (\x -> read (x:"") :: Integer) (show x)

solve :: Integer -> Integer
solve x = maximum $ map digitalSum [a ^ b | a <- [1..x-1], b <- [1..x-1]]
    where bound = 10 ^ (head $ dropWhile (\x -> x * 9^5 > 10^x) [1..])

main :: IO ()
main = putStrLn $ show (solve 100)
