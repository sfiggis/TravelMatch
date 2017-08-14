Feature: Traveller Signin
  Scenario: A traveller signs in
    Given they are registered
      And they are on the sign in page
    When they fill in their username
      And they fill in their password
      And they click the sign in button
    Then they are signed in
      And they are on the homepage