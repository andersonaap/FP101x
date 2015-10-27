{-
#0
2 ^ 3 * 4
2 * 3 + 4 * 5
2 + 3 * 4 ^ 5

(2 ^ 3) * 4
(2 * 3) + (4 * 5)
2 + (3 * (4 ^ 5))
-}


-- #1
--n = a `div` length xs
--  where a = 10
--        xs = [1, 2, 3, 4, 5]


-- #2
--last xs = drop (length xs -1) xs         -- N
--last xs = head (drop (length xs - 1) xs) -- S
-- N
-- N
--last xs = xs !! (length xs - 1)          -- S
--last xs = head (drop (length xs) xs)     -- N
--last xs = head (reverse xs)              -- S
--last xs = reverse xs !! (length xs -1)   -- N


-- #3
--init xs = tail (reverse xs)             -- N
--init xs = reverse (head (reverse xs))   -- N
--init xs = reverse (tail xs)             -- N
--init xs = take (length xs) xs           -- N
--init xs = reverse (tail (reverse xs))   -- S
--init xs = take (length xs -1) (tail xs) -- S
--init xs = drop (length xs -1) xs        -- N


-- #4
-- b)


-- #5
-- d)


-- #6
-- d)


-- #7

-- S
--qsort [] = []
--qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
--  where smaller = [a | a <- xs, a <= x]
--        larger = [b | b <- xs, b > x]

-- N
--qsort [] = []
--qsort (x:xs) = reverse(qsort smaller ++ [x] ++ qsort larger)
--  where smaller = [a | a <- xs, a <= x]
--        larger = [b | b <- xs, b > x]

-- N
--qsort [] = []
--qsort (x:xs) 
--  = reverse (qsort smaller) ++ [x] ++ reverse (qsort larger)
--  where smaller = [a | a <- xs, a <= x]
--        larger = [b | b <- xs, b > x]

-- S
--qsort [] = []
--qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
--  where smaller = [a | a <- xs, a < x || a == x]
--        larger = [b | b <- xs, b > x]

-- N
--qsort [] = []
--qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
--  where smaller = [a | a <- xs, a < x]
--        larger = [b | b <- xs, b > x]

-- S
--qsort [] = []
--qsort (x:xs) = reverse ((reverse (qsort smaller)) ++ [x] ++ (reverse (qsort larger)))
--  where smaller = [a | a <- xs, a <= x]
--        larger = [b | b <- xs, b > x]

-- N
--qsort [] = []
--qsort xs = x: qsort larger ++ qsort smaller
--  where x = maximum xs
--        smaller = [a | a <- xs, a < x]
--        larger = [b | b <- xs, b >= x]


-- #8
-- b) e)
