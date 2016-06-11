namespace ProjectEuler

module ``Problem 20`` =
    open NUnit.Framework
    open FsUnit
    open System
    open Data.Char


    //n! means n × (n − 1) × ... × 3 × 2 × 1
    //
    //For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
    //and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
    //
    //Find the sum of the digits in the number 100!

    let factorial n = [1I..n] |> List.reduce (*)

    let factorialSum n = 
        factorial n
        |> string
        |> Seq.map digitToInt
        |> Seq.sum

    [<Test>]
    [<Category("example")>]
    let example () =
        factorial 10I |> should equal 3628800I
    
    [<Test>]
    [<Category("example")>]
    let example2 () =
        factorialSum 10I |> should equal 27

    [<Test>]
    [<Category("solution")>]
    let solution () =
        factorialSum 100I |> should equal 648