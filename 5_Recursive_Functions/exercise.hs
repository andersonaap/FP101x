{-
(1)Without looking at the standard prelude, define the
following library functions using recursion:
-}

{-
Decide if all logical values in a list are true:
and :: [Bool] → Bool
-}
and' :: [Bool] -> Bool
and' []     = True
and' (x:xs) = x && and' xs

{-
Concatenate a list of lists:
concat :: [[a]] → [a]
-}
concat' :: [[a]] -> [a]
concat' []       = []
concat' (xs:xss) = xs ++ concat' xss

{-
Produce a list with n identical elements:
replicate :: Int → a → [a]
-}
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate' (n-1) x

{-
Select the nth element of a list:
(!!) :: [a] → Int → a
-}
(!!!) :: [a] -> Int -> a
[]     !!! _  = error "Index too large"
(x:_)  !!! 0  = x
(x:xs) !!! n  = xs !!! (n-1)

{-
elem :: Eq a ⇒ a → [a] → Bool
Decide if a value is an element of a list:
-}


main = do
  print $ and' [True, False]
  print $ concat' [[2,5], [1], [], [3, 4]]
  print $ replicate' 5 'a'
  print $ "Teste" !!! 0
