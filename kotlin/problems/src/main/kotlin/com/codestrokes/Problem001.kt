package com.codestrokes

import kotlin.coroutines.experimental.buildSequence

fun multiple3Or5(n: Int) = buildSequence {
    for (x in 1..(n - 1)) {
        if ((x % 3) == 0 || (x % 5) == 0) yield(x)
    }
}

class Problem1 {

    fun example() : Int {
        return multiple3Or5(10).toList().sum()
    }

    fun solution() : Int {
        return multiple3Or5(1000).toList().sum()
    }
}