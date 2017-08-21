Given(/^there are some countries$/) do
  @country = Country.find_or_create_by(name: "Bermuda", iso2: "BM", iso3: "BMU", itu: "BER", fips: "BD", currency_code: "BMD", currency_name: "Bermudian Dollar", capital: "Hamilton", continent: "NA", gdp_ppp: 52436.056406239)
  @usa = Country.find_or_create_by(name: "US", iso2: "US", iso3: "USA", itu: "USA", fips: "US", currency_code: "USD", currency_name: "US Dollar", capital: "Washington", continent: "NA", gdp_ppp: 57411.7873)

end

When(/^they visit a country page$/) do
  visit country_path(@country)
end

Then(/^they see information about a country$/) do
  expect(page).to have_content("Bermuda")
  expect(page).to have_content("Hamilton")
end