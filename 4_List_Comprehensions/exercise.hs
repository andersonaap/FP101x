{-
(1)A triple (x,y,z) of positive integers is called
pythagorean if x2 + y2 = z2. Using a list
comprehension, define a function
pyths :: Int → [(Int,Int,Int)]
that maps an integer n to all such triples with
components in [1..n]. For example:
> pyths 5
[(3,4,5),(4,3,5)]
-}
pyths   :: Int -> [(Int, Int, Int)]
pyths n =  [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x ^ 2 + y ^ 2 == z ^2]

{-
(2) A positive integer is perfect if it equals the sum of all of
its factors, excluding the number itself. Using a list
comprehension, define a function
perfects :: Int → [Int]
that returns the list of all perfect numbers up to a
given limit. For example:
> perfects 500
[6,28,496]
-}
--perfects   :: Int -> [Int]
perfects n = [x | x <- [1..n], x == sum (factors x)]
  where factors m = [x | x <- [1..m - 1], m `mod` x == 0]

{-
(3)The scalar product of two lists of integers xs and ys of
length n is give by the sum of the products of the
corresponding integers:
Using a list comprehension, define a function that
returns the scalar product of two lists.
-}
scalarp       :: [Int] -> [Int] -> Int
scalarp xs ys = sum [x * y | (x, y) <- zip xs ys]


main = do
  print $ pyths 5
  print $ perfects 500
  print $ scalarp [3, -2] [4, 5]