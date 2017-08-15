Feature: Dates Search
@wip
@javascript
  Scenario: A traveller searches for holidays by dates
    Given they are registered
      And they are logged in
      And they are on the search page
    When they fill in the departure date
      And they fill in the return date
      And they click the search button
    Given they wait for 20 seconds
    Then they generate a new search
      And they see a list of return flights
