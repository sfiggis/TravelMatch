Feature: Country Information
@wip
@javascript
  Scenario: A traveller sees information about a country
    Given they are registered
      And they are logged in
      And there are some countries
      And they have a match query
      And they are on the match results page
    When they have some countries that match their search
      And they click on the country link
      Then they see more information about the country