namespace ProjectEuler

module Prime = 
    open Microsoft.FSharp.Math
    open System
    open NUnit.Framework
    open FsUnit

    let isPrime number =
        match number with
            | _ -> seq { 2 .. int(Math.Sqrt(float number))}
            |> Seq.exists (fun x -> if (number % x = 0) then true else false)
            |> not

    let primes =
        Seq.append [2] (Seq.initInfinite (fun i -> i + 2)) //need to skip 0 and 1 for isPrime
        |> Seq.filter isPrime

    [<Test>]
    let ``simple prime sanity check`` () =
        isPrime 7 |> should equal true
    
    [<Test>]
    let ``first prime is 2`` () =
        Seq.nth 1 primes |> should equal 2


