namespace ProjectEuler

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

    let triplets s = seq { for a in 3 .. (s - 3)/3 do
                            for b in (a + 1) .. (s - 1 - a)/2 do
                                let c = s - a - b
                                if pown a 2 + pown b 2 = pown c 2 then yield (a, b, c)
                                }

    [<Test>]
    [<Category("Solution")>]
    let solution () =
        match triplets 1000 |> Seq.nth 0 with
        | (a, b, c) -> a * b * c |> should equal 31875000
