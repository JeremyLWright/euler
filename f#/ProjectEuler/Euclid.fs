namespace ProjectEuler

module Euclid =

    open NUnit.Framework
    open FsUnit
    open FsCheck

    let gcd a b = 
        let rec gcd' x y = if y = 0 then abs x else gcd' y (x % y) 
        gcd' (abs a) (abs b)

    let lcm x y = x * (y / (gcd x y))

    [<Test>]
    let ``lcm 9 10`` () = lcm 9 10 |> should equal 90
    
    [<Test>]
    let ``lcm 5 12 6`` () = Seq.reduce lcm [5; 12; 6] |> should equal 60
    
    [<Test>]
    let ``lcm 5 10 20`` () = Seq.reduce lcm [5; 10; 20] |> should equal 20
    
    [<Test>]
    let ``lcm 1..15`` () = Seq.reduce lcm [1..15] |> should equal 360360
    
    [<Test>]
    let ``lcm 1..17`` () = Seq.reduce lcm [1..17] |> should equal 12252240
    
    [<Test>]
    let ``lcm 1..19`` () = Seq.reduce lcm [1..19] |> should equal 232792560
    
    [<Test>]
    let ``lcm 1..21`` () = Seq.reduce lcm [1..21] |> should equal 232792560


    [<Test>]
    let ``gcd a a = a`` () =
        let ``gcd a a = a'`` (a:int) = gcd a a = abs a
        Check.QuickThrowOnFailure ``gcd a a = a'``

    [<Test>]
    let ``every common divisor also divides their gcd`` () =
        let ``gcd divisibility`` n m p = gcd (p*n) (p*m) = abs p * gcd n m
        Check.QuickThrowOnFailure ``gcd divisibility``



