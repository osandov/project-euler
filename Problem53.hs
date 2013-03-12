import Data.List

factorial :: Integer -> Integer
factorial x = product [1..x]

choose :: Integer -> Integer -> Integer
choose x y = (factorial x) `quot` (factorial y * factorial (x - y))

solve :: Integer -> Integer
solve x = (fromIntegral . length) $ filter (>1000000) $ concat $ map mapper [1..x]
    where mapper y = map (y `choose`) [1..y]

main :: IO ()
main = putStrLn $ show (solve 100)
