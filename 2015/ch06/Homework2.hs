
-- #7
--dec2int :: [Int] -> Int
--dec2int xs = dec2int' xs 0
--  where
--    dec2int' [] _ = 0
--    dec2int' ys b = last ys * 10 ^ b + dec2int' (init ys) (b + 1)

-- C
--dec2int xs = foldl (\acc y -> 10 * acc + y) 0 xs


-- #8
-- sum :: [Num] -> Num
-- map 2 :: [Num] -> [Num]
-- filter even :: [Int] -> [Int]

-- d
--sumsqreven = compose [sum, map (^2), filter even]
--compose = foldr (.) id


-- #9
--import Prelude hiding (curry)
-- c
--curry f = \ x y -> f (x, y)


-- #10
--import Prelude hiding (uncurry)
-- a
--uncurry f = \(x, y) -> f x y

-- #11
import Data.Char

unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)



main = print $ unfold (\a -> a >= 10) (\a -> chr (a + 65)) (\t -> t + 1) 0