solve :: Integer -> Integer
solve n = foldl1 (+) $ map mapper str
    where str = show (2^n)
          mapper x = read [x] :: Integer

main :: IO ()
main = putStrLn $ show (solve 1000)
