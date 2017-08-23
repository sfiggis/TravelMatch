Feature: Country Photos
  Scenario: An admin adds a photo to a country
    Given they are registered as an admin
      And they are already signed in as an admin
      And there is a country
      And they are on the edit country page
    When they upload an image for the country
      And they click update
    Then the country has an image
      And the admin is redirected to the country show page
      And the image is displayed on the page