
-- #0
--sum100 = sum [x ^ 2 | x <- [1..100]]

-- #1
--replicate n a = [a | _ <- [1..n]]

-- #2
--pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x ^ 2 + y ^ 2 == z ^ 2]

-- #3
--factors n = [x | x <- [1..n], n `mod` x == 0]
--perfects n = [x | x <- [1..n], (sum . init . factors $ x) == x]
--perfects n = [x | x <- [1..n], isPerfect x]
--  where isPerfect num = sum (init (factors num)) == num

-- #4
-- g = [z | zs <- [[(x, y) | y <- [4,5,6]] | x <- [1,2,3]], z <- zs]
-- h = concat [[(x,y) | y <- [4,5,6]] | x <- [1,2,3]]

-- #5
--find k t = [v | (k', v) <- t, k == k']

--positions x xs = find x (zip xs [0..n])
--  where n = length xs -1

-- #6 
--scalarproduct xs ys = sum $ zipWith (*) xs ys
--scalarproduct xs ys = sum [x * y | (x, y) <- xs `zip` ys]

-- #7
--import Data.Char

--let2int c = ord c - ord 'a'
--int2let n = chr (ord 'a' + n)

--shift n c
--  | isLower c = int2let ((let2int c + n) `mod` 26)
--  | otherwise = c

--encode n xs = [shift n x | x <- xs]

-- #8 #9 #10 

-- #11
--xs = 1:[x+1 | x <- xs]

-- #12
--riffle xs ys = concat [[x, y] | (x, y) <- xs `zip` ys]

-- #13
--divides n d = n `mod` d == 0 
--divisors x = [d | d <- [1..x], x `divides` d]
