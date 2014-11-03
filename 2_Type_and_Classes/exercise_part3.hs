

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' f ys = foldr (\x xs -> if f x then x:xs else xs) [] ys

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' f ys = foldr (\x xs -> if f x then [] else xs) [] ys

mapFilter' :: (a -> Bool) -> (a -> b) -> [a] -> [b]
mapFilter' p m ys = foldr (\x xs -> if p x then m x:xs else xs) [] ys




tw :: (a -> Bool) -> [a] -> [a]
tw f []     = []
tw f (x:xs) | f x       = x:tw f xs
            | otherwise = []

dw :: (a -> Bool) -> [a] -> [a]
dw f []     = []
dw f (x:xs) | f x       = dw f xs
            | otherwise = xs

mf :: (a -> Bool) -> (a -> b) -> [a] -> [b]
mf p m []     = []
mf p m (x:xs) | p x       = m x:mf p m xs
              | otherwise =     mf p m xs


main = do 
  print $ takeWhile' even    [2, 4, 1, 6, 1, 3, 5, 8, 0, 12, 1, 3]
  print $ dropWhile' even    [2, 4, 1, 6, 1, 3, 5, 8, 0, 12, 1, 3]
  print $ mapFilter' odd  id [2, 4, 1, 6, 1, 3, 5, 8, 0, 12, 1, 3]

