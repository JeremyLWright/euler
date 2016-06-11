namespace ProjectEuler

module ``Problem 21`` =
    open NUnit.Framework
    open FsUnit
    open System


    //Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
    //If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
    //
    //For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
    // The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
    //
    //Evaluate the sum of all the amicable numbers under 10000.

    let properDivisors m =
        let some n =
            match n with
            | n when m % n = 0 -> true
            | _ -> false
        Seq.filter some [1..(m / 2)]

    let d n = 
        properDivisors n 
        |> Seq.sum

    let amicablePair n =
        match n with 
        | n when n = d n -> false
        | n when n = ( d >> d ) n -> true
        | _  -> false
    
    [<Test>]
    [<Category("example")>]
    let example_proper_divisors () =
        properDivisors 284
        |> should equal [1; 2; 4; 71; 142]
    
    [<Test>]
    [<Category("example")>]
    let example_proper_divisors1 () =
        d 284
        |> should equal 220

    [<Test>]
    [<Category("example")>]
    let example_proper_divisors2 () =
        properDivisors 220
        |> should equal [1; 2; 4; 5; 10; 11; 20; 22; 44; 55; 110]
    
    [<Test>]
    [<Category("example")>]
    let example_proper_divisors3 () =
        d 220
        |> should equal 284
    
    [<Test>]
    [<Category("solution")>]
    let solution () =
        Seq.filter amicablePair [1..10000]
        |> Seq.sum |> should equal 31626