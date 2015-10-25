--(3) Show how the library function last that selects
--the last element of a list can be defined using
--the functions introduced in this lecture.

last'  xs = xs !! (length xs - 1)

--(4) Can you think of another possible definition?

last'' xs = head (reverse xs)

--(5) Similarly, show how the library function init
--that removes the last element from a list can
--be defined in two different ways.

init'  xs = take (length xs - 1) xs

init'' xs = reverse (tail (reverse xs))