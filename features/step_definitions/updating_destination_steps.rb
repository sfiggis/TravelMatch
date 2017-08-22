Given(/^there is a destination$/) do
  @destination = @country.airports.create!(name: "London Heathrow Airport", iso2: "GB", municipality: "London", iata_code: "LON")
end

Given(/^they are on the edit destination page$/) do
  visit edit_airport_path(@destination)
end

When(/^they add a description for the destination$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^they update the destination$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the destination has content$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the admin is redirected to the destination show page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end