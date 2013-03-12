high :: Integer -> Integer
high x | x == 0 = 0
       | otherwise = (2 * x - 1)^2

low :: Integer -> Integer
low x = high (x - 1) + 1

ring :: Integer -> [Integer]
ring x = [low x..high x]
