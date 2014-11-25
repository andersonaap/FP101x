{-
define map and filter in terms of foldr
-}

map' :: (a -> b) -> [a] -> [b]
map'    f = foldr (\x xs -> f x:xs) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x xs -> if f x then x:xs else xs) []


map'' f    = foldr g []
  where g x xs = f x:xs

filter'' f = foldr g []
  where g  x xs | f x       = x:xs
                | otherwise = xs



sum'' :: Num a => [a] -> a
sum'' []     = 0
sum'' (x:xs) = x + sum'' xs

reverse'' []     = []
reverse'' (x:xs) = (reverse xs) ++ [x]

sum'      = foldr (+)  0
product'  = foldr (*)  1
and'      = foldr (&&) True
length'   = foldr (\_ xs -> xs + 1) 0
reverse'  = foldr (\x xs -> xs ++ [x]) []
(+++) ys  = foldr (:) ys

