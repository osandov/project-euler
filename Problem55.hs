isLychrel :: Integer -> Bool
isLychrel x = length iterations' == 50
    where iterations' = takeWhile isNotPalindrome $ take 50 iterations 
          iterations = tail $ iterate iterator x
          iterator x = x + backwards x
          backwards x = (read $ reverse (show x)) :: Integer
          isNotPalindrome y = y /= backwards y

solve :: Integer -> Integer
solve x = fromIntegral $ length $ filter isLychrel [1..x]

main :: IO ()
main = putStrLn $ show (solve 10000)
