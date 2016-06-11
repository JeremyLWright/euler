namespace Data
 
module Char = 

    let digitToInt (c:char) =
        let dec = int(c) - int('0')
        let hexl = int(c) - int('a')
        let hexu = int(c) - int('A')
         
        match int(c) with
        | dec when dec <= 9 -> dec
        | hexl when hexl <= 5 -> hexl + 10
        | hexu when hexu <= 5 -> hexu + 10
        | _ -> failwith ("digitToInt: not a digit" ^ string(c))

    let firstDigit x = string(x).[0] |> int
