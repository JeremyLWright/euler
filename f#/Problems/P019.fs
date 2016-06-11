namespace ProjectEuler

module ``Problem 19`` =
    open NUnit.Framework
    open FsUnit
    open System
    open Data.Char


    //You are given the following information, but you may prefer to do some research for yourself.
    //
    //1 Jan 1900 was a Monday.
    //Thirty days has September,
    //April, June and November.
    //All the rest have thirty-one,
    //Saving February alone,
    //Which has twenty-eight, rain or shine.
    //And on leap years, twenty-nine.
    //A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
    //How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?


    let nonLeap = [|31; 28; 31; 30; 31; 30; 31; 31; 30; 31; 30; 31|]

    let leap = 31 :: 29 :: (Seq.skip 2 nonLeap |> Seq.toList)

    let nextMonth x y = (x + y) % 7

    let sunday = 0

    let monday = 1




    [<Test>]
    [<Category("solution")>]
    let solution () =
        171 |> should equal 171