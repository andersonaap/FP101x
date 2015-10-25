
all1 p xs = and (map p xs)
all3 p    = and . map p
all4 p    = not . any (not . p)
all6 p xs = foldl (&&) True  (map p xs)
all8 p    = foldr (&&) True . map p

any2 p    = or . map p
any3 p xs = length (filter p xs) > 0 
any4 p    = not . null . dropWhile (not . p)
any6 p xs = not (all (\x -> not (p x)) xs)
any7 p xs = foldr (\x acc -> (p x) || acc) False xs

map' f    = foldl (\xs x -> xs ++ [f x]) []

filter' p = foldr (\x xs -> if p x then x:xs else xs) []

dec2int = foldl (\x y -> 10 * x + y) 0

unfold p h t x | p x = []
               | otherwise = h x : unfold p h t (t x)

map'' f = unfold null (f . head) tail

iterate' f = unfold (const False) id f

main = do
  print $ all1 even [2,4..200]
  print $ all3 even [2,4..200]
  print $ all4 even [2,4..200]
  print $ all6 even [2,4..200]
  print $ all8 even [2,4..200]
  print $ any2 even ([1,3..200] ++ [201])
  print $ any3 even ([1,3..200] ++ [201])
  print $ any4 even ([1,3..200] ++ [201])
  print $ any6 even ([1,3..200] ++ [201])
  print $ any7 even ([1,3..200] ++ [201])
  print $ map' (*2) [1..10] 
  print $ filter' even [1..20]
  print $ dec2int [2, 3, 4, 5]
  print $ unfold (>=50) ((-1)*) (+3) 3
  print $ map'' (^2) [1..9]
  print $ take 20 . iterate' (*2) $ 2
  print $ take 4 (iterate (+1) 1)
  print $ foldr (-) 0 [1,2,3,4]