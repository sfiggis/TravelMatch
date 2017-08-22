Feature: Matched Country Routes
  Scenario: A traveller sees routes for a country match
    Given they are registered
      And they are logged in
      And there are some countries
    When they are on the country show page
      And they click to see routes
    Then they see a list of cheapest flights to that destination