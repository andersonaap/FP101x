import Prelude hiding (return)

type Parser a = String -> [(a, String)]

item :: Parser Char
item = \inp -> case inp of
                 []     -> []
                 (x:xs) -> [(x,xs)]

failure :: Parser a
failure = \inp -> []

return :: a -> Parser a
return v = \inp -> [(v, inp)]

(+++) :: Parser a -> Parser a -> Parser a
p +++ q = \inp -> case p inp of
                    []         -> parse q inp
                    [(v, out)] -> [(v, out)]

parse :: Parser a -> String -> [(a, String)]
parse p inp = p inp


main = do
  print $ item "abc"
  print $ item ""
  print $ return 1 "abc"
  print $ return 1 ""
  print $ parse (return 1 +++ return 2) "abc"
  print $ parse (failure +++ return 2) "abc"
  print $ parse (item +++ return 'A') "abc"
  print $ parse (item +++ return 'A') ""
  print $ parse (failure +++ item +++ return 'A') ""


