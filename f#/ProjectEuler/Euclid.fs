namespace ProjectEuler

module Euclid =

    open NUnit.Framework
    open FsUnit
    open FsCheck
    open MathNet.Numerics
    

    //let inline gcd (a:^T) (b:^T) : ^T = Euclid.GreatestCommonDivisor a b
    //let inline gcd a b = Euclid.GreatestCommonDivisor a b
    //    let rec gcd' x y = if y = 0 then abs x else gcd' y (x % y) 
    //    gcd' (abs a) (abs b)

    //type Gcd = Gcd with
    //    static member inline gcd( a:int64, b:int64) = Euclid.GreatestCommonDivisor a b
    //    static member inline gcd( a:bigint, b:bigint) = Euclid.GreatestCommonDivisor a b
    
    //let inline gcd(a:^a, b:^a) = ((^a) : (static member gcd : ^a) (a, b))

    //let inline lcm x y = x * (y / (Euclid.GreatestCommonDivisor x y))

   // [<Test>]
   // let ``lcm 9 10`` () = lcm 9 10 |> should equal 90
   // 
   // [<Test>]
   // let ``lcm 5 12 6`` () = Seq.reduce lcm [5; 12; 6] |> should equal 60
   // 
   // [<Test>]
   // let ``lcm 5 10 20`` () = Seq.reduce lcm [5; 10; 20] |> should equal 20
   // 
   // [<Test>]
   // let ``lcm 1..15`` () = Seq.reduce lcm [1..15] |> should equal 360360
   // 
   // [<Test>]
   // let ``lcm 1..17`` () = Seq.reduce lcm [1..17] |> should equal 12252240
   // 
   // [<Test>]
   // let ``lcm 1..19`` () = Seq.reduce lcm [1..19] |> should equal 232792560
   // 
   // [<Test>]
   // let ``lcm 1..21`` () = Seq.reduce lcm [1..21] |> should equal 232792560