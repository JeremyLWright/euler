
let multiple3Or5 n = seq { for x in 1 .. (n - 1)
    do if x % 3 = 0 || x % 5 = 0 then yield x }

//[<Test>]
//let sumUnder10 () = Assert.AreEqual(23, multiple3Or5 10 |> Seq.sum)

let p1 = multiple3Or5 1000 |> Seq.sum

open System 
//[<EntryPoint>]
//let main argv = 
Console.Write("{0}", p1)
