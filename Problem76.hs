f [] = []
f (x:[]) = [x]
f (x:x':xs) = (x + x'):xs

g xs = take (length xs - 1) $ iterate f xs

h x = g $ replicate x 1

{- h x = take x $ iterate iter (g x) -}
  {- where iter x = map (f . tail) $ filter (not . null) x -}
