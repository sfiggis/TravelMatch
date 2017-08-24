Given(/^those countries have airports$/) do
  @country.airports.create!(municipality: "test", iata_code: "BM", iso2: "BM")
end

When(/^they are on the country show page$/) do
  visit country_path(@country)
end

When(/^they click to see routes$/) do
  click_on 'Top Flights'
end

Then(/^they see a list of cheapest flights to that destination$/) do
  expect(page).to have_content('Top Flights')
end