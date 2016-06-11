namespace ProjectEuler

module ``Problem 6`` =
    open NUnit.Framework
    open FsUnit

    //The sum of the squares of the first ten natural numbers is,
    //
    //1^2 + 2^2 + ... + 10^2 = 385
    //The square of the sum of the first ten natural numbers is,
    //
    //(1 + 2 + ... + 10)^2 = 55^2 = 3025
    //Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
    //
    //Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

    let square a = pown a 2

    let sumOfSquares a = Seq.map square [1..a] |> Seq.sum

    let squareOfSums a = Seq.sum [1..a] |> square

    [<Test>]
    [<Category("example")>]
    let example () =
        sumOfSquares 10 |> should equal 385
    
    [<Test>]
    [<Category("example")>]
    let example2 () =
        squareOfSums 10 |> should equal 3025

    [<Test>]
    [<Category("solution")>]
    let solution () =
        squareOfSums 100 - sumOfSquares 100 |> should equal 25164150