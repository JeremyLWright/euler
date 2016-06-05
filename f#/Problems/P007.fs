namespace ProjectEuler

module ``Problem 7`` =
    open Prime
    open NUnit.Framework
    open FsUnit

    //By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
    //What is the 10 001st prime number?

    [<Test>]
    [<Category("Example")>]
    let example () =
        Seq.nth 6 Prime.primes |> should equal 13
    
    [<Test>]
    [<Category("Solution")>]
    let solution () =
        Seq.nth 10001 Prime.primes |> should equal 104743 