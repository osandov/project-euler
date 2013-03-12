solve :: Integer -> Integer
solve n = product triple
    where triple =
              head [(a, b, c) | a <- [1..n-2], b <- [1..n-2], c <- [1..n-2], a^2 + b^2 == c^2, a + b + c == n]
          product (a, b, c) = a * b * c

main :: IO ()
main = putStrLn $ show (solve 1000)
