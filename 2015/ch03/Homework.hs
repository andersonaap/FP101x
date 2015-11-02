
-- #0
-- halve :: [a] -> ([a], [a]) 

-- N
-- halve xs = (take n xs, drop n xs)
--  where n = length xs / 2

-- S
-- halve xs = splitAt (length xs `div` 2) xs

-- S
-- halve xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
--   where n = length xs

-- N
-- halve xs = splitAt (length xs `div` 2)

-- N
-- halve xs = (take n xs, drop (n + 1) xs)
--   where n = length xs `div` 2

-- S
-- halve xs = splitAt (div (length xs) 2) xs

-- N
-- halve xs = splitAt (length xs / 2) xs

-- S
-- halve xs = (take n xs, drop n xs)
--   where n = length xs `div` 2


-- #02
-- safetail :: [a] -> [a]

-- S
-- safetail xs = if null xs then [] else tail xs

-- S
-- safetail [] = []
-- safetail (_ : xs) = xs

-- N
-- safetail (_ : xs)
--   | null xs = []
--   | otherwise = tail xs

-- S
-- safetail xs
--   | null xs = []
--   | otherwise = tail xs

-- N
-- safetail xs = tail xs
-- safetail [] = []

-- S
-- safetail [] = []
-- safetail xs = tail xs

-- N
-- safetail [x] = [x]
-- safetail (_ : xs) = xs

-- S
-- safetail
--   = \ xs -> 
--       case xs of
--       	[] -> []
--       	(_ : xs) -> xs


-- #2
--import Prelude hiding ((||))

--S
--False || False = False
--_ || _ = True

--S
--False || b = b
--True || _ = True

--N
--b || c 
--  | b == c = True
--  |otherwise = False

--S
--b || c
--  | b == c = b
--  | otherwise = True

--S
--b || False = b
--_ || True = True

--S
--b || c
--  | b == c = c
--  | otherwise = True

--N
--b || True = b
--_ || True = True

--S
--False || False = False
--False || True = True
--True || False = True
--True || True = True



-- #3
--import Prelude hiding ((&&))

--S
--True && True = True
--_ && _ = False

--S
--a && b = if a then if b then True else False else False

--N
--a && b = if not (a) then not (b) else True

--N
--a && b = if a then b

--N
--a && b = if a then if b then False else True else False

--S
--a && b = if a then b else False

--S
--a && b = if b then a else False


-- #4 
-- mult x y z = x * y * z

--mult = \x -> (\y -> (\z -> x * y * z))

-- #5
-- f x g y

--((f x) g) y

-- #6
-- f::(a->a)->a
-- takes a function as argument

-- #7
-- remove :: Int -> [a] -> [a]

--remove n xs = take n xs ++ drop (n+1) xs

-- #8
funct :: Int -> [a] -> [a]
funct x xs = take (x+1) xs ++ drop x xs

--[1, 2, 3, 4, 4, 5, 6, 7]







main = print ""

















