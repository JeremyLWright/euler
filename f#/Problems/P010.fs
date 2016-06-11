namespace ProjectEuler

module ``Problem 10`` =
    open Prime
    open NUnit.Framework
    open FsUnit

    //The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

    //Find the sum of all the primes below two million.

    [<Test>]
    [<Category("example")>]
    let example () =
        Seq.takeWhile (fun y -> y < 10UL) Prime.primes |> Seq.sum |> should equal 17
    
    [<Test>]
    [<Category("solution")>]
    let solution () =
        Seq.takeWhile (fun y -> y <2000000UL) Prime.primes |> Seq.sum |> should equal 142913828922UL