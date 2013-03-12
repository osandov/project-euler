factorial :: Integer -> Integer
factorial n = foldl1 (*) [1..n]

solve :: Integer -> Integer
solve n = foldl1 (+) $ map mapper str
    where str = show (factorial n)
          mapper x = read [x] :: Integer

main :: IO ()
main = putStrLn $ show (solve 100)
