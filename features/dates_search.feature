Feature: Dates Search

  @javascript
  Scenario: A traveller searches for holidays by dates
    Given they are registered
      And they are logged in
      And they are on the search page
    When they fill in the departure date
      And they fill in the origin
      And they fill in the return date
      And they click the search button
      # need to stub out ajax
    # Then they are taken to the search page
