namespace ProjectEuler

module ``Problem 17`` =
    open NUnit.Framework
    open FsUnit
    open System


//If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
//then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

//If all the numbers from 1 to 1000 (one thousand) inclusive were written out 
//in words, how many letters would be used?

//NOTE: Do not count spaces or hyphens. For example, 
//342 (three hundred and forty-two) contains 23 letters and 
//115 (one hundred and fifteen) contains 20 letters. 
//The use of "and" when writing out numbers is in compliance with British usage.

    let one = [|"one";"two";"three";"four";"five";"six";"seven";"eight";
         "nine";"ten";"eleven";"twelve";"thirteen";"fourteen";"fifteen";
         "sixteen";"seventeen";"eighteen"; "nineteen"|]
    let ty = [|"twenty";"thirty";"forty";"fifty";"sixty";"seventy";"eighty";"ninety"|]

    let digitToInt x = 
        let y = x |> int
        y - 48



    let decompose x = 
        match x with
        | x when x = 0 -> ""
        | x when x < 20 -> one.[x - 1]
        | x when x >= 20 && x < 100 -> ty.[firstDigit x]

    
    [<Test>]
    let ``first digit of 342`` () =
        firstDigit 342 |> should equal 3
    
    [<Test>]
    let ``first digit of 42`` () =
        firstDigit 42 |> should equal 4
    
    [<Test>]
    let ``first digit of 2`` () =
        firstDigit 2 |> should equal 2


         
    [<Test>]
    [<Category("example")>]
    let ``342`` () =
        decompose 342 |> should equal 23
    
    [<Test>]
    [<Category("example")>]
    let ``115`` () =
        decompose 115 |> should equal 20

    [<Test>]
    [<Category("Solution")>]
    let solution () =
         decompose 1000 |> should equal 1366