digit :: Int -> Integer
digit x = read (c : "") :: Integer
    where c = (concat $ map show [1..]) !! (x - 1)

solve :: Integer -> Integer
solve x = product $ map digit indices
    where indices = map (10^) [0..x - 1]

main :: IO ()
main = putStrLn $ show (solve 7)
