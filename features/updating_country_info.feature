Feature: Updating Country info
  Scenario: An admin adds information to a country
    Given they are registered as an admin
      And they are already signed in as an admin
      And there is a country
      And they are on the edit country page
    When they add a description for the country
      And they click update
    Then the country has content
      And the admin is redirected to the country show page
