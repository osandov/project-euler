solve :: Integer -> Integer
solve x = sum $ filter pred $ takeWhile (< x) fibs
    where pred x = x `mod` 2 == 0
          fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main :: IO ()
main = putStrLn $ show (solve 4000000)
