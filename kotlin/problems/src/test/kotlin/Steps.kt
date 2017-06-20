import cucumber.api.java8.En
import com.codestrokes.multiple3Or5
import cucumber.api.DataTable
import cucumber.api.Delimiter
import cucumber.api.PendingException
import org.hamcrest.CoreMatchers.`is`
import org.hamcrest.MatcherAssert.assertThat

class Steps : En {
    private var result: Int? = null

    private var compositeNumber: Int? = null

    val o : () -> Unit = { print("Hello") }

    init {

        Given("^I sum the multiples of 3 or 5 below (\\d+)$",
                { upperBound: Int -> result = multiple3Or5(upperBound).toList().sum()})

        Given("^I sum of even-valued terms below (\\d+)$",
                { upperBound: Int -> throw cucumber.api.PendingException() })

        Given("^the composite number (\\d+)$",
                { compositeNumber: Int -> this.compositeNumber = compositeNumber })


       // Then("^the prime factors are (\\d+(?:, \\d+)*)$", //How can we get a List<Int>
       // Then("^the prime factors are (\\d+), (\\d+), (\\d+), (\\d+)$",
        Then("^the prime factors are$",
                { factors: DataTable ->

                    for (row in factors.raw()) {
                        print(row[0])
                    }
                })

        Then("^the largest prime factor is (\\d+)$",
                { largestPrime: Int -> throw cucumber.api.PendingException() })

        Then("^the result is (\\d+).$",
                { a: Int -> assertThat(result, `is`(a));})
    }
}