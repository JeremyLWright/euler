namespace ProjectEuler

module ``Project Euler - Problem 3`` =
    open NUnit.Framework
    open FsUnit

    //The prime factors of 13195 are 5, 7, 13 and 29.
    //
    //What is the largest prime factor of the number 600851475143 ?

    let rec factor' n x a =
        match n with
        | n when x = n -> x::a
        | n when n % x = 0UL -> factor' (n/x) x (x::a)
        | _ -> factor' n (x + 1UL) a

    let factor n = factor' n 2UL []

    [<Test>]
    let example () = 
        factor 13195UL  |> Seq.sort |> should equal [5; 7; 13; 29]

    [<Test>]
    [<Category("Solution")>]
    let solution () =
        factor 600851475143UL |> Seq.head |> should equal 6857