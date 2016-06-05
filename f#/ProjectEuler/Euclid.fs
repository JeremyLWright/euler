namespace ProjectEuler

module Euclid =

    open NUnit.Framework
    open FsUnit
    open FsCheck

    let gcd a b = 
        let rec gcd' x y = if y = 0 then abs x else gcd' y (x % y) 
        gcd' (abs a) (abs b)

    let lcm x y = x * y / (gcd x y)

    [<Test>]
    let ``lcm 9 10`` () = lcm 9 10 |> should equal 90


    [<Test>]
    let ``gcd a a = a`` () =
        let ``gcd a a = a'`` (a:int) = gcd a a = abs a
        Check.QuickThrowOnFailure ``gcd a a = a'``

    [<Test>]
    let ``every common divisor also divides their gcd`` () =
        let ``gcd divisibility`` n m p = gcd (p*n) (p*m) = abs p * gcd n m
        Check.QuickThrowOnFailure ``gcd divisibility``



