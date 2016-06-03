namespace ProjectEuler

module ``Project Euler - Problem 4`` =
    open NUnit.Framework
    open FsUnit

    //Largest Palindrome product
    //A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
    //Find the largest palindrome made from the product of two 3-digit numbers.
    //Answer 906609

    let reverseString (s:string) = new string(Array.rev(s.ToCharArray()))

    let triplets =
        seq { for y in [100..999] do
                for z in [100..y] do
                    let x=z*y
                    let s = string x
                    if s = reverseString s then yield x}

    [<Test>]
    [<Category("Solution")>]
    let solution () =
        triplets |> Seq.max |> should equal 906609