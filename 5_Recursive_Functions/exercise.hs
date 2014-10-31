{-
(1)Without looking at the standard prelude, define the
following library functions using recursion:
-}

{-
and :: [Bool] → Bool
Decide if all logical values in a list are true:
-}
and' :: [Bool] -> Bool
and' []     = True
and' (x:xs) = x && and' xs



main = do
  print $ and' [True, False]
