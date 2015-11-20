-- #0
-- [f x | x <- xs, ps x]
-- c

-- #1
--import Prelude hiding (all)
--all :: (a -> Bool) -> [a] -> Bool
--all p xs = foldr (\x acc -> acc && p x) True xs

-- S
--all p xs = and (map p xs)

-- N
--all p xs = map p (and xs)

-- S
--all p = and . map p

-- S
--all p = not . any (not . p)

-- N
--all p = map p . and

-- S
--all p xs = foldl (&&) True (map p xs)

-- N
--all p xs = foldr (&&) False (map p xs)

-- S
--all p = foldr (&&) True . map p


-- #2
--import Prelude hiding (any)
--any :: (a -> Bool) -> [a] -> Bool

-- N
--any p = map p . or 

-- S
--any p = or . map p

-- S
--any p xs = length (filter p xs) > 0

-- S
--any p = not . null . dropWhile (not . p)

-- N
--any p = null . filter p

-- S
--any p xs = not (all (\ x -> not (p x)) xs)

-- S
--any p xs = foldr (\ x acc -> (p x) || acc) False xs

-- N
--any p xs = foldr (||) True (map p xs)


-- #3
--import Prelude hiding (takeWhile)
--takeWhile :: (a -> Bool) -> [a] -> [a]

--takeWhile _ [] = []
--takeWhile p (x:xs)
--  | p x = x : takeWhile p xs
--  | otherwise = []

-- b


-- #4
--import Prelude hiding (dropWhile)
--dropWhile :: (a -> Bool) -> [a] -> [a]

--dropWhile _ [] = []
--dropWhile p (x:xs)
--  | p x = dropWhile p xs
--  | otherwise = x: xs

-- a


-- #5
--import Prelude hiding (map)
--map :: (a -> b) -> [a] -> [b]

-- d


-- #6
--import Prelude hiding (filter)
--filter :: (a -> Bool) -> [a] -> [a]

--filter p = foldr (\x xs -> if p x then x : xs else xs) []

-- b


-- #7

--decToint xs = 
--  where rxs = reverse xs
--        f x []     | []
--        f x (x:xs) | 







