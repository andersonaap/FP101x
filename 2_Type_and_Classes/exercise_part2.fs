

let map    f ys = List.foldBack (fun x xs -> (f x)::xs )                  ys []
let filter f ys = List.foldBack (fun x xs -> if (f x) then x::xs else xs) ys []



let numeros    = [1..6]
let pares      = filter (fun x -> x % 2 = 0) numeros
let quadradros = map    (fun x -> x * x)     numeros

printfn "%A" pares
printfn "%A" quadradros
