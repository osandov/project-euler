four = (takeWhile (<10000) . dropWhile (<1000))
poly f = four $ map f [1..]

tris = poly (\n -> n * (n + 1) `div` 2)
squares = poly (\n -> n * n)
pents = poly (\n -> n * (3 * n - 1) `div` 2)
hexs = poly (\n -> n * (2 * n - 1))
hepts = poly (\n -> n * (5 * n + 1) `div` 2)
octs = poly (\n -> n * (3 * n - 2))

polys = [tris, squares, pents, hexs, hepts, octs]

matches = map mapper tris
  where fil x y = x == y `div` 100
        mapper x = (x, map (filter (fil (x `mod` 100))) $ tail polys)
