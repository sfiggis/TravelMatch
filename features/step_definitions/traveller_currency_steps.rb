Given(/^there is a country$/) do
  @country = Country.find_or_create_by(name: "Bermuda", iso2: "BM", iso3: "BMU", itu: "BER", fips: "BD", currency_code: "BMD", currency_name: "Bermudian Dollar", capital: "Hamilton", continent: "NA", gdp_ppp: 52436.056406239)
end


Given(/^they are on the edit profile page$/) do
  visit edit_traveller_path(@traveller)
end

When(/^they fill in the currency field$/) do
  select @country.currency_name, :from => 'country[country_ids]'
end

When(/^they click save$/) do
  click_on 'Update'
end

Then(/^they have a currency$/) do
  expect(@traveller.countries.count).to eq 1
  expect(@traveller.traveller_countries.first.home).to eq true
  expect(Country.find(@traveller.traveller_countries.first.country_id).currency_name).to eq "Bermudian Dollar"
end

When(/^they are redirected to their profile page$/) do
  expect(page.current_path).to eq "/travellers/#{@traveller.id}"
end

Then(/^they see their currency preference$/) do
  expect(page).to have_content(@country.currency_name)
end