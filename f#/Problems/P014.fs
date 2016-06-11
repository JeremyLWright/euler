namespace ProjectEuler

module ``Problem 14`` =
    open Prime
    open NUnit.Framework
    open FsUnit
    open System

    let collatz_step n =
        match n with 
        | n when n < 0UL -> failwith "Negative Stuff..."
        | n when n % 2UL = 0UL -> n / 2UL
        | _ -> 3UL*n + 1UL

    let collatz n =
        let collatz' n =
            n |> Seq.unfold (fun x -> 
                match x with
                | 1UL -> None
                | _ -> Some(x, collatz_step x))
        Seq.append (collatz' n) [1UL]

    let collatz_pair n = (collatz n |> Seq.length), n

    [<Test>]
    [<Category("example")>]
    let example () =
        collatz 13UL  |> should equal [13; 40 ;  20 ;  10 ;  5 ;  16 ;  8 ;  4 ;  2 ;  1]
    
    [<Test>]
    [<Category("solution")>]
    let solution () =
        let x = Seq.map collatz_pair [1UL..1000000UL] |> Seq.max 
        snd x |> should equal 837799UL
        fst x |> should equal 525UL 


