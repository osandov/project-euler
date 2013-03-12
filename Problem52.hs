import Data.List

antipred :: Integer -> Bool
antipred x = (a /= b) || (b /= c) || (c /= d) || (d /= e) || (e /= f)
    where a = sort $ show x
          b = sort $ show (2 * x)
          c = sort $ show (3 * x)
          d = sort $ show (4 * x)
          e = sort $ show (5 * x)
          f = sort $ show (6 * x)

solve = head $ dropWhile antipred [1..]
