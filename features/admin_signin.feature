Feature: Admin Signin
  Scenario: An admin signs in
    Given they are registered as an admin
      And they are on the admin sign in page
    When they fill in their admin email
      And they fill in their admin password
      And they click the admin sign in button
    Then they are signed in as an admin
      And they are on the homepage