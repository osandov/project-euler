solve :: Int -> Integer
solve x = (2:3:(filter isPrime form)) !! (x - 1)
    where form = concatMap (\y -> [6 * y - 1, 6 * y + 1]) [1..]
          factors x = filter (\y -> x `mod` y == 0) [2..floor $ sqrt (fromIntegral x)]
          isPrime x = null $ factors x

main :: IO ()
main = putStrLn $ show (solve 10001)
