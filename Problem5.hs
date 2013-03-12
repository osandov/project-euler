import Data.List

mostCompositeFactors :: Integer -> [Integer]
mostCompositeFactors x = filter (\y -> not $ y `elem` allFactors) [1..x]
    where factors x = filter (\y -> x `mod` y == 0) [1..x]
          allFactors = nub $ concatMap (init . factors) [1..x]

solve :: Integer -> Integer
solve x = head $ dropWhile pred [x,x+x..bound]
    where pred n = or $ map (mapper n) compositeFactors
          mapper x y = (x `mod` y) /= 0
          bound = foldl1 (*) [2..x]
          compositeFactors = mostCompositeFactors x

main :: IO ()
main = putStrLn $ show (solve 20)
