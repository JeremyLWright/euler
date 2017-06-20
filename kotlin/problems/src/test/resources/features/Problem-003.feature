Feature: Problem 3

  # The prime factors of 13195 are 5, 7, 13 and 29.
  # What is the largest prime factor of the number 600851475143 ?

  Scenario: Largest prime factor example
    Given the composite number 12195
    Then the prime factors are
    | 5 |
    | 7 |
    | 13|
    |29 |

 Scenario: Largest prime factor
    Given the composite number 600851475143
    Then the largest prime factor is 6857