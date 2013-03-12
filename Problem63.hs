{- All positive n-digit nth powers satisfy the property
 -  10 ^ (n - 1) <= x ^ n < 10 ^ n, {x : 'Z, x > 0}
 - Notice:
 -  x ^ n < 10 ^ n => x < 10 and
 -  x ^ n >= 10 ^ (n - 1) => (x / 10) ^ n >= 1 / 10 -}

{- Here we get the values n for which the second inequality holds for each
 - integer x in [1, 10). It was determined emperically that n will satisfy the
 - inequality on an interval of the form [1, m], with m >= 1 -}
nRange :: Int -> [Int]
nRange x = takeWhile pred [1..]
  where pred n = (fromIntegral x / 10.0) ** fromIntegral n >= 0.1

{- Simply sum the number of values of n satisfying the inequality for each x -}
solve :: Int
solve = length $ concat $ map nRange [1..9]

main :: IO ()
main = putStrLn $ show solve
