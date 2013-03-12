import Data.List
import Data.Digits

perm :: [[Integer]]
perm = permutations [1..9]

split :: [Integer] -> Int -> Int -> (Integer, Integer, Integer)
split xs a b = (mcand, mplier, prod)
    where mcand = unDigits 10 (take a xs)
          mplier = unDigits 10 (take b $ drop a xs)
          prod = unDigits 10 (drop (a + b) xs)

mcand :: (Integer, Integer, Integer) -> Integer
mcand (x, _, _) = x

mplier :: (Integer, Integer, Integer) -> Integer
mplier (_, x, _) = x

prod :: (Integer, Integer, Integer) -> Integer
prod (_, _, x) = x

sopred :: Int -> Int -> [Integer] -> Bool
sopred a b xs = (mcand s) * (mplier s) == prod s
    where s = split xs a b

solve = sum (nub mapped)
    where set1 = filter (sopred 1 4) perm
          set2 = filter (sopred 2 3) perm
          mapped = map (\x -> unDigits 10 (drop 5 x)) (set1 ++ set2)

main :: IO ()
main = putStrLn $ show solve
