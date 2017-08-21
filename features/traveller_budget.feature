Feature: Traveller Budget
@javascript
  Scenario: A traveller adds a budget to a search
    Given they are registered
      And they are logged in
      And they are on the search page
    When they click the match button
    When they choose a budget range
      And they click the second match button
    Then they have a new search with a budget range