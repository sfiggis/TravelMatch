Feature: Logout
  Scenario: A traveller logs out
    Given they are registered
      And they are logged in
    When they are on the traveller profile page
      And they click on logout
    Then they are logged out

  Scenario: An admin logs out
    Given they are registered as an admin
      And they are already signed in as an admin
    When they are on their profile page
      And they click on logout
    Then they are logged out as an admin