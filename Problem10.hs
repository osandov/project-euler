solve x = sum $ takeWhile (<x) (2:3:(filter isPrime form))
    where form = concatMap (\y -> [6 * y - 1, 6 * y + 1]) [1..]
          factors x = filter (\y -> x `mod` y == 0) [2..floor $ sqrt (fromIntegral x)]
          isPrime x = null $ factors x
