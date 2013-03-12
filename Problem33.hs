import Data.List
import Data.Ratio

poss :: Integer -> Integer -> [(Integer, Integer)]
poss x y = filter (\(a, b) -> a /= int && b /= int) lis
    where int = read (show x `intersect` show y) :: Integer
          lis = [((x `quot` 10), (y `quot` 10)),
                ((x `mod` 10), (y `quot` 10)),
                ((x `mod` 10), (y `mod` 10)),
                ((x `quot` 10), (y `mod` 10))]

solvePred :: Integer -> Integer -> Bool
solvePred x y = (x < y) && (haveIntersect x y)
    where haveIntersect x y = (not . null) (show x `intersect` show y) && (nonTrivial x y)
          nonTrivial x y = (y `mod` 10 /= 0) && (canCancel x y)
          canCancel x y = length (poss x y) == 1 && (unorth x y)
          unorth x y = (x % y) == (fst . head) (poss x y) % (snd . head) (poss x y)

solve :: Rational
solve = product [(x % y) | x <- [10..98], y <- [10..99], solvePred x y]

main :: IO ()
main = putStrLn $ (show solve)
