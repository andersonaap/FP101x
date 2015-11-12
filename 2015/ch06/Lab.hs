module Lab3 where

-----------------------------------------------------------------------------------------------------------------------------
-- LIST COMPREHENSIONS
------------------------------------------------------------------------------------------------------------------------------

-- ===================================
-- Ex. 0 - 2
-- ===================================

evens :: [Integer] -> [Integer]
evens xs = [x | x <- xs, even x]

-- ex0 = sum . evens $ [827305 .. 927104] 
-- ex0 = 43772529500
-- ex1 = sum . evens $ []
-- ex1 = 0
-- ex2 = sum . evens $ [1,3..]
-- ex2 = d)

-- ===================================
-- Ex. 3 - 4 
-- ===================================

-- complete the following line with the correct type signature for this function
-- squares :: ... 
squares :: Integer -> [Integer]
squares n = [x * x | x <- [1..n]]

-- ex3 = b)

sumSquares :: Integer -> Integer
sumSquares n = sum (squares n)

--ex4 = sumSquares 50
--ex4 = 42925

-- ===================================
-- Ex. 5 - 7
-- ===================================

-- complete the following line with the correct type signature for this function
-- squares' :: ...
squares' m n = [x * x | x <- [(n+1)..(n+m)]]

sumSquares' :: Integer -> Integer
sumSquares' x = sum . uncurry squares' $ (x, x)

--ex5 = sumSquares' 50
-- 295425
--ex6 = sum $ squares' 10 0
-- 385
--ex7 = sum $ squares' 0 10
-- 0

-- ===================================
-- Ex. 8
-- ===================================

coords :: Integer -> Integer -> [(Integer,Integer)]
coords m n = [(m, n) | m <- [0..m], n <- [0..n]]

--ex8 = foldr (-) 0 . map (uncurry (*)) $ coords 5 7
-- -60



-- #9
-- c

-- #10
-- b

-- #11
-- d 

-- #12
-- d
