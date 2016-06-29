namespace ProjectEuler

module ``Problem 23`` =
    open NUnit.Framework
    open FsUnit
    open System
    open NumberTheory
    
    //A perfect number is a number for which the sum of its proper 
    //divisors is exactly equal to the number. For example, the sum 
    //of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, 
    //which means that 28 is a perfect number.
    //
    //A number n is called deficient if the sum of its proper divisors 
    //is less than n and it is called abundant if this sum exceeds n.
    //
    //As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
    //the smallest number that can be written as the sum of two 
    //abundant numbers is 24. By mathematical analysis, it can be 
    //shown that all integers greater than 28123 can be written as 
    //the sum of two abundant numbers. However, this upper limit 
    //cannot be reduced any further by analysis even though it is 
    //known that the greatest number that cannot be expressed as 
    //the sum of two abundant numbers is less than this limit.
    //
    //Find the sum of all the positive integers which cannot be 
    //written as the sum of two abundant numbers.


    let sequenceA048243Limit = 20161UL

    let abundants = Seq.filter Sequences.isAbundant [1UL..sequenceA048243Limit]
    
    let abundantSums = 
        seq {
            for x in abundants do
                for y in abundants do
                    if (x + y) < sequenceA048243Limit then yield x + y} 
        |> Seq.sum

    let nonAbundantSums = 
        Seq.sum [1UL..sequenceA048243Limit] - abundantSums


    //[<Test>]
    //[<Category("solution")>]
    //let solution23 () = 
    //    nonAbundantSums |> should equal 4179871
        //Seq.unfold (fun n -> 
        //    match (x + y) with
        //    match n with
        //    | -> None
        //    | -> Some(a, b))
