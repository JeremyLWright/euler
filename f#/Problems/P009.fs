﻿namespace ProjectEuler

module ``Problem 9`` =
    open Prime
    open NUnit.Framework
    open FsUnit

    //A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
    //
    //a^2 + b^2 = c^2
    //For example, 32 + 42 = 9 + 16 = 25 = 52.
    //
    //There exists exactly one Pythagorean triplet for which a + b + c = 1000.
    //Find the product abc.
    //Answer: 31875000

    let triplets = 1

    [<Test>]
    [<Category("Solution")>]
    let solution () =
        triplets |> should equal 31875000
