solve :: Integer -> Integer
solve n = sum $ map (\x -> x ^ x) [1..n]

main :: IO ()
main = putStrLn $ reverse $ take 10 $ (reverse . show) (solve 1000)
