// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.

namespace ProjectEuler

module ``Problem 1`` =
    open NUnit.Framework
    open FsUnit
    open System 

    let multiple3Or5 n = seq { for x in 1 .. (n - 1)
        do if x % 3 = 0 || x % 5 = 0 then yield x }
        
    [<Test>]
    let sumUnder10 () = multiple3Or5 10 |> Seq.sum |> should equal 23
    
    [<Test>]
    [<Category("solution")>]
    let answer () = multiple3Or5 1000 |> Seq.sum |> should equal 233168
