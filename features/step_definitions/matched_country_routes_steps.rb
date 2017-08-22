When(/^they are on the country show page$/) do
  visit country_path(@country)
end

When(/^they click to see routes$/) do
  click_on 'Top Flights'
end

Then(/^they see a list of cheapest flights to that destination$/) do
  expect(page).to have_content('Top Flights')
end