namespace ProjectEuler

module Prime = 
    open Microsoft.FSharp.Math
    open System
    open NUnit.Framework
    open FsUnit
    open System.Runtime.InteropServices

    [<DllImport("primesieve.dll")>]
    extern int primesieve_test()

    let isPrime number =
        match number with
            | _ -> seq { 2UL .. uint64(Math.Sqrt(float number))}
            |> Seq.exists (fun x -> if (number % x = 0UL) then true else false)
            |> not

    let primes =
        Seq.append [2UL] (Seq.unfold (fun n -> Some(n, n + 2UL)) 3UL
        |> Seq.filter isPrime)

    [<Test>]
    let ``simple prime sanity check`` () =
        isPrime 7UL |> should equal true
    
    [<Test>]
    let ``first prime is 2`` () =
        Seq.nth 0 primes |> should equal 2

    [<Test>]
    let ``native prime integration test`` () =
        primesieve_test() |> should equal 1


