Given(/^there is a country with a currency$/) do
  @country = Country.create!(name: "Bermuda", iso2: "BM", iso3: "BMU", itu: "BER", fips: "BD", currency_code: "BMD", currency: "Bermudian Dollar", capital: "Hamilton", continent: "NA")
end


Given(/^they are on the edit profile page$/) do
  visit edit_traveller_path(@traveller)
end

When(/^they fill in the currency field$/) do
  select @country.currency, :from => 'country[country_ids]'
end

When(/^they click save$/) do
  click_on 'Update'
end

Then(/^they have a currency$/) do
  expect(@traveller.countries.count).to eq 1
  expect(@traveller.traveller_countries.first.home).to eq true
  expect(Country.find(@traveller.traveller_countries.first.country_id).currency).to eq "Bermudian Dollar"
end

When(/^they are redirected to their profile page$/) do
  expect(page.current_path).to eq "/travellers/#{@traveller.id}"
end

Then(/^they see their currency preference$/) do
  expect(page).to have_content(@country.currency)
end