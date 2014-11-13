module Lab3 where

-----------------------------------------------------------------------------------------------------------------------------
-- LIST COMPREHENSIONS
------------------------------------------------------------------------------------------------------------------------------

main = do
  print $ evens [1,2,3,4,5,6,7,8]
  print $ sum . evens $ [827305 .. 927104]
  print $ sum . evens $ []
  print $ squares 11
  print $ sumSquares 50
  print $ squares' 4 2
  print $ squares' 2 0
  print $ squares' 0 2
  print $ squares' 0 0
  print $ sumSquares' 50
  print $ sum $ squares' 10 0
  print $ sum $ squares' 0 10
  print $ coords 1 1
  print $ coords 1 2
  print $ foldr (-) 0 . map (uncurry (*)) $ coords 5 7
  return ()

-- ===================================
-- Ex. 0 - 2
-- ===================================

evens :: [Integer] -> [Integer]
evens xs = [x | x <- xs, x `mod` 2 == 0]

-- ===================================
-- Ex. 3 - 4 
-- ===================================

-- complete the following line with the correct type signature for this function
squares :: Integer -> [Integer]
squares n = [x ^ 2 | x <- [1..n]]

sumSquares :: Integer -> Integer
sumSquares n = sum (squares n)

-- ===================================
-- Ex. 5 - 7
-- ===================================

-- complete the following line with the correct type signature for this function
--squares' ::  Integer -> Integer -> [Integer]
squares' m n = [x ^ 2 | x <- [n+1..m+n]]


sumSquares' :: Integer -> Integer
sumSquares' x = sum . uncurry squares' $ (x, x)

-- ===================================
-- Ex. 8
-- ===================================

coords :: Integer -> Integer -> [(Integer,Integer)]
coords m n = [(x, y) | x <- [0..m], y <- [0..n]]
