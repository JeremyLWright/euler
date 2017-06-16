import cucumber.api.CucumberOptions
import cucumber.api.junit.Cucumber
import org.junit.runner.RunWith

@RunWith(value = Cucumber::class)
@CucumberOptions(
        format = arrayOf("pretty", "junit:target/timings.xml"),
        features = arrayOf("classpath:features")
        )
public class CucumberTest {
}
