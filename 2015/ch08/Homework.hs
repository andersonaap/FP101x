import Control.Monad


-- #0 - c

-- #1 - b
putStr' :: String -> IO ()
putStr' []     = return ()
putStr' (x:xs) = putChar x >> putStr' xs

-- #2 - a; b; c; e;
putStrLn' :: String -> IO ()
putStrLn' xs = putStr' xs >> putChar '\n'

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putStrLn' ""

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putChar '\n'

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >>= \x -> putChar '\n'

-- N

--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putStr' "\n"

-- N
-- N
-- N

-- #3 - c
-- -- aqui nao eh tail recursion
--getLine' :: IO String
--getLine' = get' --  >>= \xs -> print xs >> putStrLn' xs >> return ""
--get' :: IO String
--get' = 
--  do
--    c <- getChar
--    case c of
--      '\n' -> return ""
--      _    -> do cs <- get'; return (c:cs);

getLine' :: IO String
getLine' = get' []

get' :: String -> IO String
get' xs = 
  do x <- getChar
     case x of 
          '\n' -> return xs
          _    -> get' (xs ++ [x])

-- #4 - a
interact' :: (String -> String) -> IO ()
interact' f
  = do xs <- getLine'
       putStrLn' (f xs)


-- #5 - b; d; e; g
sequence_' :: Monad m => [m a] -> m ()
sequence_' []     = return ()
sequence_' (m:ms) = do m; sequence_' ms;

-- N

--sequence_' [] = return ()
--sequence_' (m:ms) = (foldl (>>) m ms) >> return ()

-- N
--sequence_' ms = foldl (>>) (return ()) ms

--sequence_' []     = return ()
--sequence_' (m:ms) = m >> sequence_' ms

--sequence_' []     = return ()
--sequence_' (m:ms) = m >>= \_ -> sequence_' ms

-- N

--sequence_' ms = foldr (>>) (return ()) ms

-- N - nao valeu em todos
--sequence_' ms = foldr (>>) (return []) ms



-- #6 -- a; e; h;
sequence' :: Monad m => [m a] -> m [a]
sequence' []     = return []
sequence' (m:ms) = do m1 <- m; ms1 <- sequence' ms; return (m1:ms1)

-- S
--sequence' [] = return []
--sequence' (m:ms) 
--  = m >>= 
--      \ a ->
--        do as <- sequence' ms
--           return (a:as)

-- N
--sequence' ms = foldr func (return ()) ms
--  where 
--    func m acc
--      = do a  <- m
--           as <- acc
--           return (a:as)


-- N
--sequence' ms = foldr func (return []) ms
--  where
--    func :: (Monad m) => m a -> m [a] -> m [a]
--    func m acc = m:acc

-- N

-- S
--sequence' ms = foldr func (return []) ms
--  where 
--    func m acc
--      = do a  <- m
--           as <- acc
--           return (a:as)

-- N

-- N
--sequence' [] = return []
--sequence' (m:ms) = m >>= \a -> do
--  as <- sequence' ms
--  return (a:as)

-- S
--sequence' [] = return []
--sequence' (m:ms) 
--  = do a  <- m
--       as <- sequence' ms
--       return (a:as)



-- #7 - a; b; f; g
mapM' :: Monad m => (a -> m b) -> [a] -> m [b]

-- S
-- mapM' f as = sequence' (map f as)

-- S
--mapM' f [] = return []
--mapM' f (a:as) 
--  = f a >>= \b -> mapM' f as >>= \bs -> return (b:bs) 

-- N
--mapM' f as = sequence_' (map f as)

-- N

-- N

-- S
mapM' f []     = return []
mapM' f (a:as) 
  = do b <- f a
       bs <- mapM' f as
       return (b:bs)

-- S
--mapM' f [] = return []
--mapM' f (a:as) 
--  = f a >>=
--      \ b -> 
--        do bs <- mapM' f as
--           return (b : bs)

-- N
--mapM' f [] = return []
--mapM' f (a:as) 
--  = f a >>=
--      \ b -> 
--        do bs <- mapM' f as
--           return (bs ++ [b])



-- #8 - b
filterM' :: Monad m => (a -> m Bool) -> [a] -> m [a]

filterM' _ []     = return []
filterM' p (x:xs) 
  = do flag <- p x
       ys <- filterM' p xs
       if flag then return (x:ys) else return ys


-- #9 - d
foldLeftM ::  Monad m => (a -> b -> m a) -> a -> [b] -> m a
foldLeftM _ a []     = return a
foldLeftM f a (x:xs) = do
  a' <- f a x
  foldLeftM f a' xs

-- #10 - a
foldRightM :: Monad m => (a -> b -> m b) -> b -> [a] -> m b
foldRightM _ a []     = return a
foldRightM f a xs = do
  a' <- f (last xs) a
  foldRightM f a' (init xs)


-- #11 - a; c;
liftM' :: Monad m => (a -> b) -> m a -> m b
--liftM' f mx = mx >>= \x -> return (f x)

-- S

-- N

-- S

-- N

-- N - devido ao side effect
liftM' f m = m >>= \ a -> m >>= \ b -> return (f a)

-- N - devido ao side effect
--liftM' f m = m >>= \ a -> m >>= \ b -> return (f b)

-- N
--liftM' f m = mapM f [m]

-- N



