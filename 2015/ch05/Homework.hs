
-- #0
--import Prelude hiding ((^))

--N
--m ^ 0 = 0
--m ^ n = m * m ^ (n - 1)

--S
--m ^ 0 = 1
--m ^ n = m * m ^ (n - 1)

--N
--m ^ 0 = 1
--m ^ n = m * m ^ n - 1

--N
--m ^ 0 = 1
--m ^ n = n * n ^ (m - 1)

--S
--m ^ 0 = 1
--m ^ n = m * (^) m (n - 1)

--N
--m ^ 0 = 1
--m ^ n = m * m * m ^ (n - 2)

--N
--m ^ 0 = 1
--m ^ n = (m * m) ^ (n - 1)

--N
--m ^ 1 = m
--m ^ n = m * m ^ (n - 1)


-- #1
--length [1, 2, 3]
--1 + length [2, 3]
--1 + 1 + length [3]
--1 + 1 + 1 + length []
--1 + 1 + 1 + 0
--1 + 1 + 1
--1 + 2
--3

-- #2
--drop 3 [1, 2, 3, 4, 5]
--drop 2 [2, 3, 4, 5]
--drop 1 [3, 4, 5]
--drop 0 [4, 5]
--[4, 5]

-- #3
--init [1, 2, 3]
--1 : init [2, 3]
--1 : 2 : init [3]
--1 : 2 : []
--[1,2]

-- #4
--import Prelude hiding (and)

--S
--and [] = True
--and (b:bs) = b && and bs

--S
--and [] = True
--and (b:bs) 
--  | b = and bs
--  | otherwise = False

--N
--N

--S
--and [] = True
--and (b:bs) 
--  | b == False = False
--  | otherwise = and bs

--N

--S
--and [] = True
--and (b:bs) = and bs && b

--N


-- #5
--import Prelude hiding (concat)

--concat :: [[a]] -> [a]
--concat [] = [] 
--concat (xs:xss) = xs ++ concat xss 


-- #6
--import Prelude hiding (replicate)

--replicate :: Int -> a -> [a] 
--replicate 0 _ = []
--replicate n x = x : replicate (n - 1) x


-- #7
--import Prelude hiding ((!!))

--(x:_) !! 0 = x
--(_:xs) !! n = xs !! (n -1)


-- #8
--import Prelude hiding (elem)

--elem :: Eq a => a -> [a] -> Bool
--elem _ [] = False
--elem x (y:ys)
--  | x == y = True
--  | otherwise = elem x ys

-- #9
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x < y then x : merge xs (y:ys) else y : merge (x:xs) ys 

-- #10
halve xs = splitAt (length xs `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
  where (ys, zs) = halve xs
