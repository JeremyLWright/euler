namespace ProjectEuler

module ``Problem 5`` =
    open NUnit.Framework
    open FsUnit
    open Euclid

    //2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
    //What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    
    [<Test>]
    [<Category("example")>]
    let example () =
        Seq.reduce Euclid.lcm [1..10] |> should equal 2520

    [<Test>]
    [<Category("solution")>]
    let solution () =
        Seq.reduce Euclid.lcm [1..20] |> should equal 232792560