namespace Data
 
module Char = 

    open NUnit.Framework
    open FsUnit

    let digitToInt (c:char) =
        let dec = int(c) - int('0')
        let hexl = int(c) - int('a')
        let hexu = int(c) - int('A')
         
        match c with
        | c when dec <= 9 -> dec
        | c when hexl <= 5 -> hexl + 10
        | c when hexu <= 5 -> hexu + 10
        | _ -> failwith ("digitToInt: not a digit" + string(c))

    let firstDigit x = string(x).[0] |> digitToInt

    [<Test>]
    let ``first digit of 342`` () =
        firstDigit 342 |> should equal 3
    
    [<Test>]
    let ``first digit of 42`` () =
        firstDigit 42 |> should equal 4
    
    [<Test>]
    let ``first digit of 2`` () =
        firstDigit 2 |> should equal 2



