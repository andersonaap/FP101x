module Lab4 where

------------------------------------------------------------------------------------------------------------------------------
-- RECURSIVE FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------

import Data.Char

-- ===================================
-- Ex. 0
-- ===================================

triangle :: Integer -> Integer
triangle 0 = 0
triangle n = n + triangle (n - 1)

-- o pattern n+k nao funciona no ghc

-- #0
-- triangle 500 = 125250

-- #1 - d
-- triangle -500

-- #2 - c

-- ===================================
-- Ex. 1
-- ===================================

count :: Eq a => a -> [a] -> Int
count _ [] = 0
count x (x':xs) 
  | x == x'   = 1 + count x xs
  | otherwise = count x xs

xs = [1,2,35,2,3,4,8,2,9,0,5,2,8,4,9,1,9,7,3,9,2,0,5,2,7,6,92,8,3,6,1,9,2,4,8,7,1,2,8,0,4,5,2,3,6,2,3,9,8,4,7,1,4,0,1,8,4,1,2,4,56,7,2,98,3,5,28,4,0,12,4,6,8,1,9,4,8,62,3,71,0,3,8,10,2,4,7,12,9,0,3,47,1,0,23,4,8,1,20,5,7,29,3,5,68,23,5,6,3,4,98,1,0,2,3,8,1]
ys = map (\x -> ((x + 1) * 3) ^ 3 - 7) xs

poem = [ "Three Types for the Lisp-kings under the parentheses,"
       , "Seven for the Web-lords in their halls of XML,"
       , "Nine for C Developers doomed to segfault,"
       , "One for the Dark Lord on his dark throne"
       , "In the Land of Haskell where the Monads lie."
       , "One Type to rule them all, One Type to find them,"
       , "One Type to bring them all and in the Lambda >>= them"
       , "In the Land of Haskell where the Monads lie."
       ]

-- #3
--count 722 ys = 14

-- #4 - 16


-- ===================================
-- Ex. 2
-- ===================================

euclid :: (Int,  Int) -> Int
euclid (x, y)
  | x < y     = euclid (y - x, x)
  | x > y     = euclid (y, x - y)
  | otherwise = x

-- #5 - 12
-- #6 - E

-- ===================================
-- Ex. 3
-- ===================================

funkyMap :: (a -> b) -> (a -> b) -> [a] -> [b]
funkyMap _ _ []         = []
funkyMap f g (x1:[])    = [f x1]
funkyMap f g (x1:x2:xs) = f x1 : g x2 : funkyMap f g xs

-- #7 - 112319712, 16805




-- #8 - a
-- #9 - b
-- #10 - a
-- #11 - d
-- #12 - b
-- #13 - c
-- #14 - a
-- #15 - c
-- #16 - b
-- #17 - a;b;d
-- #18 - a
-- #19 - b
-- #20 - ?


