Given(/^they have a home country$/) do
  @country = Country.create!(name: "United Kingdom", capital: "London", airport_code: "LON", latitude: 55.3781, longitude: -3.4360)
  @traveller.update(home_location_id: @country.id)
end

When(/^they visit their profile page$/) do
  visit traveller_path(@traveller)
end

Then(/^they see their home country on the map$/) do
  expect(page).to have_selector("img[src='data:#{@country.id}']", count: 1)
end