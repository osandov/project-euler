import Data.Ratio
import Data.Digits

l = concat $ map (\x -> [1,x,1]) [2,4..]

l' = reverse $ take 100 l

e x = 2 + foldl (\x y -> 1 / (x + y)) (0 % 1) (reverse $ take x l)

solve x = (sum . (digits 10) . numerator) $ e (x - 1)
