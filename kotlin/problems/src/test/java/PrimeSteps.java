

public class PrimeSteps implements En {

    public PrimeSteps() {

        Given("^a prime number generator$", () -> { print("Hello") });

        Then("^the first ten primes are$",
                (DataTable primes) -> { throw PendingException(); }
        );

    }

}