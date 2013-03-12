import Data.List

solve :: [Integer] -> Integer
solve xs = last $ filter isPalindrome $ sort products 
    where products = [(a * b) | a <- xs, b <- xs]
          isPalindrome x = show x == reverse (show x)

main :: IO ()
main = putStrLn $ show (solve [100..999])
