namespace ProjectEuler

module ``Problem 17`` =
    open NUnit.Framework
    open FsUnit
    open System
    open Data.Char


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

    let rec decompose x = 
        match x with
        | x when x = 0 -> ""
        | x when x < 20 -> one.[x - 1]
        | x when x >= 20 && x < 100 -> ty.[firstDigit x - 2] + decompose (x- firstDigit(x)*10)
        | x when x < 1000 && x % 100 = 0 -> one.[firstDigit x - 1] + "hundred"
        | x when x > 100 && x <= 999 -> one.[firstDigit x - 1] + "hundredand" + decompose (x - firstDigit x * 100)
        | x when x = 1000 -> "onethousand"
        | _  -> failwith "decompose is not define for input" + string(x)

    
    [<Test>]
    [<Category("example")>]
    let ``342`` () =
        decompose 342 |> should equal "threehundredandfortytwo"
    
    [<Test>]
    [<Category("example")>]
    let ``length 342`` () =
        decompose 342 |> String.length |> should equal 23 
    
    [<Test>]
    [<Category("example")>]
    let ``115`` () =
        decompose 115 |> should equal "onehundredandfifteen"
    
    [<Test>]
    [<Category("example")>]
    let ``length 115`` () =
        decompose 115 |> String.length |> should equal 20

    [<Test>]
    [<Category("example")>]
    let ``1000`` () =
         decompose 1000 |> should equal "onethousand"
    [<Test>]
    [<Category("solution")>]
    let solution () =
        Seq.map (decompose >> String.length) [1..1000] |> Seq.sum |> should equal 21124