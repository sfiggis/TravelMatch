Feature: Traveller Registration
@javascript
  Scenario: A traveller registers with the site
    Given they are on the sign up page
    When they enter their username
      And they enter their email
      And they enter their password
      And they confirm their password
      And they register
    Then they have a new account
      And they get sent to the homepage
      And they see a message welcoming them into Travel Match
      And they receive an email asking them to confirm their email address