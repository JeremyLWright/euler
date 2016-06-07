namespace ProjectEuler

module ``Problem 14`` =
    open Prime
    open NUnit.Framework
    open FsUnit
    open System

    let collatz_step n =
        match n % 2 with
        | 0 -> n / 2
        | _ -> 3*n + 1

    let rec collatz n =
        match n with
        | 1 -> Seq.singleton 1
        | _ -> Seq.append [n] (collatz_step n |> collatz)

    let collatz_pair n = (collatz n |> Seq.length), n

    [<Test>]
    [<Category("Example")>]
    let example () =
        collatz 13 |> should equal [13; 40 ;  20 ;  10 ;  5 ;  16 ;  8 ;  4 ;  2 ;  1]
    
    [<Test>]
    [<Category("Example")>]
    let exampleLength () =
        collatz_pair 13 |> should equal (10, 13)

    //[<Test>]
    //[<Category("Solution")>]
    //let solution () =
    //    Seq.map collatz_pair [1..1000000] 
    //    |> Seq.max
    //    |> should equal (1, 837799)


