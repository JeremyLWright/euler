let collatz_step n =
    match n % 2 with
    | 0 -> n / 2
    | _ -> 3*n + 1

let rec collatz n =
    match n with
    | 1 -> Seq.singleton 1
    | _ -> Seq.append [n] (collatz_step n |> collatz)

let collatz_pair n = (collatz n |> Seq.length), n



collatz_step 4
