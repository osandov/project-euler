solve :: Integer
solve x = squareOfSum - sumOfSquares
    where squareOfSum = (sum [1..x]) ^ 2
          sumOfSquares = sum (map (^2) [1..x])

main :: IO ()
main = putStrLn $ show (solve 100)
