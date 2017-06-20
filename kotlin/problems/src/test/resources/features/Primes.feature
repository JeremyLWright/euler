Feature: Primes

  Scenario: The first ten primes
    Given a prime number generator
    Then the first ten primes are
    | 2 |
    | 3 |
    | 5 |
    | 7 |
    | 11 |
    | 13 |
    | 17 |
    | 19 |
    | 23 |
    | 29 |
    | 31 |