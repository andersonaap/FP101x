{-
(1)Without looking at the standard prelude, define the
following library functions using recursion:
-}

{-
Decide if all logical values in a list are true:
and :: [Bool] → Bool
-}
and'        :: [Bool] -> Bool
and' []     =  True
and' (x:xs) =  x && and' xs

{-
Concatenate a list of lists:
concat :: [[a]] → [a]
-}
concat'          :: [[a]] -> [a]
concat' []       =  []
concat' (xs:xss) =  xs ++ concat' xss

{-
Produce a list with n identical elements:
replicate :: Int → a → [a]
-}
replicate'     :: Int -> a -> [a]
replicate' 0 _ =  []
replicate' n x =  x : replicate' (n-1) x

{-
Select the nth element of a list:
(!!) :: [a] → Int → a
-}
(!!!)         :: [a] -> Int -> a
[]     !!! _  =  error "Index too large"
(x:_)  !!! 0  =  x
(_:xs) !!! n  =  xs !!! (n-1)

{-
elem :: Eq a ⇒ a → [a] → Bool
Decide if a value is an element of a list:
-}
elem'          :: Eq a => a -> [a] -> Bool
elem' _ []     =  False
elem' y (x:xs) |  x ==y     = True
               |  otherwise = elem' y xs

{-
(2) Define a recursive function
merge :: [Int] → [Int] → [Int]
that merges two sorted lists of integers to give a single
sorted list. For example:
> merge [2,5,6] [1,3,4]
[1,2,3,4,5,6]
-}
merge :: [Int] -> [Int] -> [Int]
merge []     ys     = ys
merge xs     []     = xs
merge (x:xs) (y:ys) | x < y     = x:merge xs     (y:ys)
                    | otherwise = y:merge (x:xs) ys

{-
(3) Define a recursive function
msort :: [Int] → [Int]
that implements merge sort, which can be specified
by the following two rules:
Lists of length ≤ 1 are already sorted;
Other lists can be sorted by sorting the two halves
and merging the resulting lists.
-}
msort :: [Int] -> [Int]
msort []     = []
msort (x:[]) = x:[]
msort (x:xs) = msort lt ++ [x] ++ msort gt
  where comp op []     = []
        comp op (a:as) | op a x    = a:comp op as
                       | otherwise =   comp op as
        (lt, gt) = (comp (<) xs, comp (>) xs)

main = do
  print $ and' [True, False]
  print $ concat' [[2,5], [1], [], [3, 4]]
  print $ replicate' 5 'a'
  print $ "Teste" !!! 1
  print $ elem' 'r' "Anderson"
  print $ [2, 5, 8] `merge` [3, 4, 7]
  print $ msort [4,1,5,8,9,2,3,7]
