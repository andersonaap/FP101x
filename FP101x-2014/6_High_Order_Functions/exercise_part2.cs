/*
define map and filter in terms of foldr
*/

using System;
using System.Collections.Generic;
using System.Linq;


public static class _
{
    public static IEnumerable<TOut> map<TIn, TOut>(Func<TIn, TOut> f, IEnumerable<TIn> xs)
    {
        return
            xs.Aggregate(
                Enumerable.Empty<TOut>()
                , (ys, y) => Enumerable.Concat<TOut>(ys, new[] { f(y) })
            );
    }

    public static IEnumerable<T> filter<T>(Predicate<T> f, IEnumerable<T> xs)
    {
        return
            xs.Aggregate(
                Enumerable.Empty<T>()
                , (ys, y) => f(y) ? Enumerable.Concat<T>(ys, new[] { y }) : ys
            );
    }

    public static IEnumerable<TOut> map<TIn, TOut>(this IEnumerable<TIn> xs, Func<TIn, TOut> f)
    {
        return map(f, xs);
    }

    public static IEnumerable<T> filter<T>(this IEnumerable<T> xs, Predicate<T> f)
    {
        return filter(f, xs);
    }
}

class Program
{
    static void Main()
    {
        var numeros   = Enumerable.Range(1, 6);
        var pares     = _.filter(x => x % 2 == 0, numeros); // numeros.filter(x => x % 2 == 0);  //
        var quadrados = _.map(x => x * x, numeros);         // numeros.map(x => x * x);          //

        print(pares);
        print(quadrados);
    }

    static void print<T>(IEnumerable<T> lista)
    {
        Console.Write("{");
        foreach (var item in lista) { Console.Write("{0}, ", item); }
        Console.WriteLine("}");
    }
}
