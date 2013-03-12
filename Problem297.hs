fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

backFibs = reverse $ takeWhile (<10^17) fibs

construct n = dropWhile (>n) backFibs

zeck n = aux (construct n) n 1
  where aux (x:xs) n acc
            | x == n = acc
            | x > n  = aux xs n acc
            | x < n  = aux xs (n - x) (acc + 1)
