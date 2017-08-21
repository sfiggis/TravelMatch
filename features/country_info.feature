Feature: Country Information
  Scenario: A traveller sees information about a country
    Given they are registered
      And they are logged in
      And there are some countries
    When they visit a country page
    Then they see information about a country
