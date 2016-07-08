namespace ProjectEuler

module ``Problem 5`` =
    open NUnit.Framework
    open FsUnit
    open Euclid
    open MathNet.Numerics

    //2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
    //What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    
    [<Test>]
    [<Category("example")>]
    let example () =
        Euclid.LeastCommonMultiple [|1L..10L|]  |> should equal 2520

    [<Test>]
    [<Category("solution")>]
    let solution () =
        Euclid.LeastCommonMultiple [|1L..20L|] |> should equal 232792560