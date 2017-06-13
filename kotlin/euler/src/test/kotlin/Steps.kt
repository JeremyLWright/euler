import cucumber.api.java8.En
import com.codestrokes.multiple3Or5
import org.hamcrest.CoreMatchers.`is`
import org.hamcrest.MatcherAssert.assertThat

class Steps : En {
    private var result: Int? = null

    init {

        Given("^I sum the multiples of 3 or 5 below (\\d+)$",
                { upperBound: Int -> result = multiple3Or5(upperBound).toList().sum()})

        Then("^the result is (\\d+).$",
                { a: Int -> assertThat(result, `is`(a));})
    }
}