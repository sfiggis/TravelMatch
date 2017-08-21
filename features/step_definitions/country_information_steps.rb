Given(/^there are some countries$/) do
  @country = Country.find_or_create_by(name: "Bermuda", iso2: "BM", iso3: "BMU", itu: "BER", fips: "BD", currency_code: "BMD", currency_name: "Bermudian Dollar", capital: "Hamilton", continent: "NA", gdp_ppp: 52436.056406239)
  @usa = Country.find_or_create_by(name: "US", iso2: "US", iso3: "USA", itu: "USA", fips: "US", currency_code: "USD", currency_name: "US Dollar", capital: "Washington", continent: "NA", gdp_ppp: 57411.7873)

end

Given(/^they have a match query$/) do
  @search = @traveller.searches.create!(origin: "MOW", departure_date: Date.new(2017,11, 01), return_date: Date.new(2017,11, 03), budget: 1000)
end

Given(/^they are on the match results page$/) do
  visit search_path(@search)
end

When(/^they have some countries that match their search$/) do
  expect(@search.destination_results).not_to be_empty
end

When(/^they click on the country link$/) do
  click_link('Bermuda')
end

Then(/^they see more information about the country$/) do
  expect(page).to have_content("Hamilton")
end