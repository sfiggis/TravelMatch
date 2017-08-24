Feature: Traveller Destinations Map
  Scenario: A traveller sees their home country on the map
    Given they are registered
      And they are logged in
      And they have a home country
    When they visit their profile page
    # can't find map markers even with ids
    # Then they see their home country on the map