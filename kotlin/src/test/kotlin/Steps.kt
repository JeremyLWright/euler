import cucumber.api.java8.En
import hello.multiple3Or5
import org.hamcrest.CoreMatchers.`is`
import org.hamcrest.MatcherAssert.assertThat

class Steps : En {
    private var result: Int? = null

    init {

        Given("^I sum the multiples of 3 or 5 below (\\d+)$", { a: Int -> result = multiple3Or5(a).toList().sum()})

        Then("^the sum is (\\d+).$", { a: Int -> assertThat(result, `is`(a));})
    }
}