Feature: Updating Destination info
  Scenario: An admin adds information to a destination
    Given they are registered as an admin
      And they are already signed in as an admin
      And there is a country
      And there is a destination
      And they are on the edit destination page
    When they add a description for the destination
      And they update the destination
    Then the destination has content
      And the admin is redirected to the airport show page