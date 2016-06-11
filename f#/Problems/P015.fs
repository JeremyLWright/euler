namespace ProjectEuler

module ``Problem 15`` =
    open Prime
    open NUnit.Framework
    open FsUnit
    open System

    let product xs = Seq.fold (fun acc x -> acc * x) 1UL xs
    
    let choose n k = List.fold (fun s i -> s * (n-i+1UL)/i ) 1UL [1UL..k]

    
    [<Test>]
    [<Category("solution")>]
    let solution () =
        choose (2UL*20UL) 20UL |> should equal 137846528820UL