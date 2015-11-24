module Main (main) where
import Data.List
import Data.Char
import Hugs.IOExts (unsafeCoerce)

data Nat = Zero
         | Succ Nat
         deriving Show


-- #0 - a, b, d, g
natToInteger :: Nat -> Integer
--ex0_1 = natToInteger Zero
--ex0_2 = natToInteger (Succ Zero)
--ex0_3 = natToInteger (Succ (Succ (Succ (Succ Zero))))
--ex0 = print (ex0_1, ex0_2, ex0_3)

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
--ex1 = (integerToNat 0, integerToNat 1, integerToNat 4)

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
ex2 = (Zero `add` Zero
     , Zero `add` (Succ Zero)
     , Zero `add` integerToNat 2
     , integerToNat 3 `add` integerToNat 2)

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
ex3 = (Zero `mult` (Succ (Succ Zero))
     , integerToNat 3 `mult` Zero
     , (Succ Zero) `mult` integerToNat 2
     , integerToNat 3 `mult` integerToNat 2)

--mult Zero     _ = Zero
--mult (Succ m) n = n `add` (m `mult` n)


--   4 * 3 
-- = 3 + (3 * 3)
-- = 3 + (3 + (2 * 3))
-- = 3 + (3 + (3 + (1 * 3)))
-- = 3 + (3 + (3 + (3)))
-- = 3 + (3 + (6))
-- = 3 + (9)
-- = 12

mult m Zero = Zero
mult m (Succ n) = add m (mult m n)





main = print "main"
