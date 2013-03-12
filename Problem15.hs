factorial :: Integer -> Integer
factorial x = product [1..x]

squareFactorial :: Integer -> Integer
squareFactorial x = product $ map (\y -> y * y) [1..x]

solve :: Integer -> Integer
solve x = factorial (2 * x) `quot` squareFactorial x

main :: IO ()
main = putStrLn $ show (solve 20)
