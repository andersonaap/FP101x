

--type Parser = String -> Tree
--type Parser = String -> (Tree, String)
--type Parser = String -> [(Tree, String)]
type Parser a = String -> [(a, String)]

item :: Parser Char
item = \inp -> case inp of
               []     -> []
               (x:xs) -> [(x, xs)]

failure :: Parser a
failure = \inp -> []

return :: a -> Parser a
return v = \inp -> [(v, inp)]

success :: a -> Parser a
success v = \inp -> [(v, inp)]

(+++) :: Parser a -> Parser a -> Parser a
p +++ q = \inp -> case p inp of
                  []         -> q inp
                  [(v, out)] -> [(v, out)]

parse :: Parser a -> String -> [(a, String)]
parse p inp = p inp


--p :: Parser (Char, Char)
--p = do x <- item
--       item
--       Prelude.return (x,x)



main = do
  print "hi"
  print $ (item "abc", item "")
  print $ ((failure::Parser Char) "abc", (failure::Parser Int) "")
  print $ (Main.return 'a' "abc", Main.return 1 "123", Main.return 'a' "", Main.return 1 "")
  print $ ((failure::Parser Char) +++ (Main.return 'a')) "abc" 
  print $ (parse item "abc", parse (Main.return 1) "abc")


