Feature: Admin Registration
  Scenario: An admin registers
    Given they are on the admin sign up page
      And they enter their admin email
      And they enter their admin password
      And they confirm their admin password
    When they register as an admin
    Then they have a new admin account
    And they get sent to the admin page
      And they see a message welcoming them into Travel Match as an admin
      And they receive an email asking them to confirm their admin email address