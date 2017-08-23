Feature: Destination Photos
  Scenario: An admin adds a photo to a detination
      Given they are registered as an admin
        And they are already signed in as an admin
        And there is a country
        And there is a destination
        And they are on the edit destination page
      When they upload an image for the destination
        And they click update
      Then the destination has an image
        And the admin is redirected to the airport show page
        And the image is displayed on the page