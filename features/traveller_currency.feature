Feature: Traveller Currency
  Scenario: A traveller adds a currency to their profile
    Given they are registered
      And they are logged in
      And there is a country
      And they are on the edit profile page
    When they fill in the country field
      And they click save
    Then they have a currency
      And they are redirected to their profile page
      And they see their currency preference