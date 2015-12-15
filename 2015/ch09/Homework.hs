module Main (main) where
import Data.List
import Data.Char
import Data.Foldable
import Hugs.IOExts (unsafeCoerce)

data Nat = Zero
         | Succ Nat
         deriving Show


-- #0 - a, b, d, g
natToInteger :: Nat -> Integer

-- S
--natToInteger Zero = 0
--natToInteger (Succ n) = natToInteger n + 1

-- S
--natToInteger (Succ n) = natToInteger n + 1
--natToInteger Zero = 0

-- N

-- S
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

-- N

-- S
--natToInteger = head . m
--  where m Zero = [0]
--        m (Succ n) = [sum [x | x <- (1: m n)]]

-- S
--natToInteger = \n -> genericLength [c | c <- show n, c == 'S']

-- N
--natToInteger = \n -> length [c | c <- show n, c == 'S']


-- #1
integerToNat :: Integer -> Nat

integerToNat 0 = Zero
integerToNat n = Succ (integerToNat (n-1))

-- S
--integerToNat 0 = Zero
--integerToNat (n+1) = Succ (integerToNat n)

-- N

-- N
--integerToNat n 
--  = product [(unsafeCoerce c) :: Integer | c <- show n]

-- N

-- S
--integerToNat (n+1) = Succ (integerToNat n)
--integerToNat 0 = Zero

-- S
--integerToNat (n+1) = let m = integerToNat n in Succ m
--integerToNat 0 = Zero

--integerToNat = head . m
--  where {
--        ; m 0 = [0]
--        ; m (n + 1) = [sum [x | x <- (1: m n)]]
--        }

--integerToNat = \n -> genericLength [c | shown n, isDigit c]

-- #2 - a, b, c, h, i
add :: Nat -> Nat -> Nat
add Zero     n    = n
add (Succ m) n    = m `add` (Succ n)

-- S
--add Zero n     = n
--add (Succ m) n = Succ (add n m)

-- S
--add (Succ m) n = Succ (add n m)
--add Zero n     = n

-- S
--add (Succ m) n = Succ (add n m)
--add Zero n     = n

-- N
-- N
-- N
-- N

-- S
--add n Zero     = n
--add n (Succ m) = Succ (add m n)

-- S
--add n (Succ m) = Succ (add m n)
--add n Zero     = n


-- #3 - b
mult :: Nat -> Nat -> Nat
mult Zero     _ = Zero
mult (Succ m) n = n `add` (m `mult` n)

--mult m Zero = Zero
--mult m (Succ n) = add m (mult m n)


-- #4 - a, e
--data Tree = Leaf Integer
--          | Node Tree Integer Tree

--t1 = Node 
--       (Node (Node (Leaf 1) 2 (Node (Leaf 3) 4 (Leaf 5))) 6 (Leaf 8)) 
--       10
--       (Node (Leaf 12) 14 (Leaf 15))

--occurs :: Integer -> Tree -> Bool

-- S
--occurs m (Leaf n) = m == n
--occurs m (Node l n r) 
--  = case compare m n of
--       LT -> occurs m l
--       EQ -> True
--       GT -> occurs m r

-- N
-- N
-- N

-- S
--occurs m (Leaf n) = m == n
--occurs m (Node l n r) 
--  | m == n = True
--  | m < n  = occurs m l
--  | otherwise = occurs m r

-- N
-- N
-- N



-- #5

data Tree = Leaf Integer
          | Node Tree Tree
    deriving (Show)


leaves :: Tree -> Int
leaves (Leaf _) = 1
leaves (Node l r) = leaves l + leaves r

balanced :: Tree -> Bool
--balanced (Leaf _)   = True
--balanced (Node l r) = (&& balanced r) . (&& balanced r) . (<= 1) . abs $ (sl - sr)
--  where sl = leaves l
--        sr = leaves r

balanced (Leaf _)   = True
balanced (Node l r) 
  = abs (leaves l - leaves r) <= 1 && balanced l && balanced r

t1 = Node 
       (Node (Node (Leaf 1) (Node (Leaf 3) (Leaf 5))) (Leaf 8)) 
       (Node (Leaf 12) (Leaf 15))

t2 = Node 
      (
        Node 
          (
            Node 
              (Leaf 3) 
              (Leaf 5)
          )
        (Leaf 8)
      ) 
      (
        Node 
          (Leaf 12)
          (Leaf 15)
      )

-- #62 - a
balance :: [Integer] -> Tree

halve xs = splitAt (length xs `div` 2) xs
balance [x] = Leaf x
balance xs = Node (balance ys) (balance zs)
  where (ys, zs) = halve xs


-- #7 - 
data Expr = Add Expr Expr | Val Int
     deriving (Show)

-- Add (Val 1) (Val 2)
-- Add (Int -> Expr) (Int -> Expr)
-- (Int -> Expr) -> (Int -> Expr) -> Expr

-- #8 - e

-- #9 - b
data Maybe9 a = Just9 a
              | Nothing9
              deriving (Show)

instance Monad Maybe9 where
  return x = Just9 x
  -- (>>=) :: Maybe9 a -> (a -> Maybe9 b) -> Maybe9 b
  Nothing9  >>= _ = Nothing9
  (Just9 x) >>= f = f x

sum9 :: Maybe9 Int -> Maybe9 Int -> Maybe9 Int
sum9 x y = x >>= \a -> y >>= \b -> return (a + b)


-- #10 -- c
class Monad10 m where
  return10  :: a -> m a
  (>>>==) ::  m b -> (b -> m c) -> m c

instance Monad10 [] where
  return10 x = [x]
  xs >>>== f = concat (map f xs) 

instance Monad10 Maybe9 where
  return10 x = Just9 x
  Nothing9  >>>== _ = Nothing9
  (Just9 x) >>>== f = f x


-- #11 - a
class Monoid11 a where
  mempty11 :: a
  (<<>>) :: a -> a -> a

instance Monoid11 [a] where
  mempty11 = []
  (<<>>) = (++) 

''
-- #12 - d
class Functor12 f where
  fmap12 :: (a -> b) -> f a -> f b

instance Functor12 Maybe9 where
  fmap12 _ Nothing9 = Nothing9
  fmap12 f (Just9 m) = Just9 (f m) 


-- #13
class (Functor12 f) => Foldable13 f where
  fold13 :: (Monoid11 m) => f m -> m


instance Foldabl13 [] where
  fold13 (Functor12 f) =  

    foldr :: (a - b - b) b - [a] - b


main = do
  --print $ (occurs 10 t6, occurs 7 t6, occurs 6 t6, occurs 13 t6)
  --print $ (leaves (Leaf 0), leaves t1, leaves t2)
  --print $ (balanced (Leaf 0), balanced t1, balanced t2)
  --print $ balanced (balance [1..6])
  --print $ balance [1..8]
  --print $ Add (Val 1) (Val 2)
  print "hi"
  print $ (sum9 (Just9 2) (Just9 3), sum9 (Just9 5) (Nothing9))
  print $ [1..5] >>>== \m -> return10 (m^2)
  print $ ((mempty11::[Int]), [1..5] <<>> [6..7])
  print $ (fmap12 (^2) (Nothing9), fmap12 (^2) (Just9 3))

