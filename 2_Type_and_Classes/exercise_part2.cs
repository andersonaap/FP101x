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
        var numeros = new[] { 1, 2, 3, 4, 5, 6 };
        var quadrados = _.map(numeros, x => x * x);         // numeros.map(x => x * x);          //
        var pares     = _.filter(numeros, x => x % 2 == 0); // numeros.filter(x => x % 2 == 0);  //

        foreach (var q in quadrados)
        {
            Console.WriteLine(q);
        }

        foreach (var p in pares)
        {
            Console.WriteLine(p);
        }
    }
}
