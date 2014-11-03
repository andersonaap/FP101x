(*
(1)A triple (x,y,z) of positive integers is called
pythagorean if x2 + y2 = z2. Using a list
comprehension, define a function
pyths :: Int → [(Int,Int,Int)]
that maps an integer n to all such triples with
components in [1..n]. For example:
> pyths 5
[(3,4,5),(4,3,5)]
*)
let pyths (n : int) : (int * int * int) list =
    [for x in 1..n do
     for y in 1..n do
     for z in 1..n do
     if (x*x) + (y*y) = (z*z) then
        yield (x, y, z)]

(*
(2) A positive integer is perfect if it equals the sum of all of
its factors, excluding the number itself. Using a list
comprehension, define a function
perfects :: Int → [Int]
that returns the list of all perfect numbers up to a
given limit. For example:
> perfects 500
[6,28,496]
*)
let perfects (n : int) : int list =
    let factors m = [for x in [1..m-1] do if m % x = 0 then yield x]
    [for x in [1..n] do if x = List.sum (factors x) then yield x]

(*
(3)The scalar product of two lists of integers xs and ys of
length n is give by the sum of the products of the
corresponding integers:
sum i=0..n−1 (xsi ∗ ysi)
Using a list comprehension, define a function that
returns the scalar product of two lists.
*)
let scalarp (xs : int list) (ys : int list) : int =
    List.sum [for (x, y) in List.zip xs ys -> x * y]

printfn "%A" <| pyths 5
printfn "%A" <| perfects 500
printfn "%A" <| scalarp [3; -2] [4; 5]
