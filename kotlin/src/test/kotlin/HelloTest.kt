package hello.tests

import hello.Problem1
import hello.getHelloString
import hello.multiple3Or5
import org.hamcrest.Matchers.`is`
import org.junit.Assert.assertThat
import kotlin.test.assertEquals
import org.junit.Test



class HelloTest {
    @Test fun testAssert() : Unit {
        assertEquals("Hello, world!", getHelloString())
    }

    @Test fun Problem1Example() : Unit {
        assertThat(Problem1.example(), `is`(23))
    }

    @Test fun Problem1Solution() : Unit {
        assertThat(Problem1.solution(), `is`(233168))
    }

}
