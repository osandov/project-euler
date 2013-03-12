import Data.List

countDigits :: Integer -> Int
countDigits x = length $ show x

isPrime :: Integer -> Bool
isPrime x = null $ fac x
    where fac x = filter (\y -> x `mod` y == 0) [2..floor (sqrt $ fromIntegral x)]

candidates :: Integer -> [Integer]
candidates x = map (\y -> read y :: Integer) filtered
    where filtered = filter pred rotations
          pred xs = null $ xs `intersect` "025"
          rotations = nub $ take (countDigits x) strs
          strs = iterate (\ys -> last ys : init ys) (show x)

solve x = length allPrime
    where allPrime = filter pred nonempty
          pred x = all isPrime x
          nonempty = filter (not . null) can
          can = [2]:[3]:[5]:(map candidates [6..x])

main :: IO ()
main = putStrLn $ show (solve 1000000)
