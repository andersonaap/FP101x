-- #1 - d
removeone :: Eq a => a -> [a] -> [a]
removeone x [] = []
removeone x (y:ys)
  | x == y = ys
  | otherwise = y : removeone x ys


-- #2 - a
isChoice :: Eq a => [a] -> [a] -> Bool
--isChoice xs ys = and [elem x ys | x <- xs]

isChoice [] _ = True
isChoice _ [] = False
isChoice (x:xs) ys = elem x ys && isChoice xs (removeone x ys)

-- #3 - d
split :: [a] -> [([a], [a])]
split [] = [] 
split [_] = []
split (x:xs) = ([x], xs) : [(x: ls, rs) | (ls, rs) <- split xs]


main = do
  print "do"
  --print $ removeone 2 [4, 6, 2, 4, 2, 6]
  --print $ isChoice [2..7] [1..6]
  --print $ isChoice [2..5] [1..6]
  --print $ isChoice [6, 7, 2, 8, 5, 2, 4] ([1..10]++[2])
  print $ split [1..4]

