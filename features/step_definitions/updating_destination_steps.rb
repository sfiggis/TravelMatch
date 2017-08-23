Given(/^there is a destination$/) do
  @destination = @country.airports.create!(name: "London Heathrow Airport", iso2: "GB", municipality: "London", iata_code: "LON")
end

Given(/^they are on the edit destination page$/) do
  visit edit_airport_path(@destination)
end

When(/^they add a description for the destination$/) do
  @text = "Warm-heartedness reinforces our self-confidence giving us not a blind confidence, but a sense of confidence based on reason. When you have that you can act transparently, with nothing to hide! Likewise, if you are honest, the community will trust you. Trust brings friendship, as a result of which you can always feel happy. Whether you look to the right or the left, you will always be able to smile."
  fill_in 'Content', with: @text
end

When(/^they update the destination$/) do
  click_on 'Update'
end

Then(/^the destination has content$/) do
  @destination.reload
  expect(@destination.content).to eq @text
end