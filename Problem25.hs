countDigits :: Integer -> Integer
countDigits n = head $ dropWhile pred [1..]
    where pred x = n `quot` 10 ^ x /= 0

solve :: Integer -> Integer
solve n = fst $ head $ dropWhile pred zipped
    where zipped = zip [0..] fibs
          fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
          pred (a, b) = countDigits b < n

main :: IO ()
main = putStrLn $ show (solve 1000)
