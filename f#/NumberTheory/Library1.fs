namespace NumberTheory

module Sequences =
    open NUnit.Framework
    open FsUnit
    open LanguagePrimitives


    let inline properDivisors m = 
        let inline f n = 
            match n with
            | n when m % n = LanguagePrimitives.GenericZero -> true
            | _ -> false

        let divisorLimit = m / (LanguagePrimitives.GenericOne + LanguagePrimitives.GenericOne)
        Seq.filter f [LanguagePrimitives.GenericOne..divisorLimit]

    let inline isPerfectNumber n = properDivisors n |> Seq.sum = n

    let inline d n = 
        properDivisors n 
        |> Seq.sum

    let inline isAbundant n = d n > n
    
    let inline isDeficient n = d n < n


    
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
    let ``divisors of 28`` () =
        properDivisors 28 |> Seq.toList |> should equal [1; 2; 4; 7; 14]

    [<Test>]
    [<Category("example")>]
    let ``28 is a perfect number`` () =
        isPerfectNumber 28 |> should equal true
    
    [<Test>]
    [<Category("example")>]
    let ``12 is an abundant number`` () =
        isAbundant 12 |> should equal true