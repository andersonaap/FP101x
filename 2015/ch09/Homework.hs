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
ex1 = (integerToNat 0, integerToNat 1, integerToNat 4)

--integerToNat 0 = Zero
--integerToNat n = Succ (integerToNat (n-1))

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

--imntegerToNat = head . m
--  where {
--        ; m 0 = [0]
--        ; m (n + 1) = [sum [x | x <- (1: m n)]]
--        }

imntegerToNat = \n -> genericLength [c | shown n, isDigit c]

main = print "main"
