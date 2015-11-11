
-- #7
--dec2int :: [Int] -> Int
--dec2int xs = dec2int' xs 0
--  where
--    dec2int' [] _ = 0
--    dec2int' ys b = last ys * 10 ^ b + dec2int' (init ys) (b + 1)

-- c
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
--import Prelude hiding (map)
--import Prelude hiding (iterate)

--unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
--unfold p h t x
--  | p x = []
--  | otherwise = h x : unfold p h t (t x)

--chop8' [] = []
--chop8' bits = take 8 bits : chop8' (drop 8 bits)
-- b
--chop8 = unfold null (take 8) (drop 8) 


-- #12
-- c
--map :: (a -> b) -> [a] -> [b]
--map f = unfold null (f . head) tail


-- #13
-- a
--iterate :: (a -> a) -> a -> [a]
--iterate f = unfold (const False) id f


-- #14
-- d

-- #15
-- d

-- #16
-- c





main = do 
  -- print $ chop8 [0,0,0,0,1,1,1,1,0,1,0,1,0,1,0,1]
  -- print $ map (^2) [2..7]
  -- print $ take 8 $ iterate' (`div`2) 1024
  
  print "fim"




















