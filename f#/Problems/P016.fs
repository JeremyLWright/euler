namespace ProjectEuler

module ``Problem 16`` =
    open Prime
    open NUnit.Framework
    open FsUnit
    open System
         
    let expSum n = 
         (pown 2I n) 
         |> string 
         |> Seq.map (fun s -> int(s) - int('0'))
         |> Seq.sum
    [<Test>]
    [<Category("example")>]
    let example () =
         expSum 15 |> should equal 26

    [<Test>]
    [<Category("Solution")>]
    let solution () =
         expSum 1000 |> should equal 1366