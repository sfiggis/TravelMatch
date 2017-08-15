Given(/^they are logged in$/) do
  page.set_rack_session('warden.user.traveller.key' => Traveller.serialize_into_session(@traveller))
end

Given(/^they are on the search page$/) do
  visit root_path
end

When(/^they fill in the departure date$/) do
  within "#search" do
    fill_in 'departureDate', :with => Date.new(2017,10,2)
  end
end

When(/^they fill in the return date$/) do
  within "#search" do
    fill_in 'returnDate', :with => Date.new(2017,10,8)
  end
end

When(/^they click the search button$/) do
  # @search_button = page.find('#searchButton').click
  # click_on @search_button
  find_button('Search').trigger('click')
  page.driver.debug
end

Given(/^they wait for (\d+) seconds$/) do |n|
  sleep(n.to_i)
end

Then(/^they generate a new search$/) do
  @traveller.reload
  expect(@traveller.searches.count).to eq 1
  expect(@traveller.searches.departure_date).to match Date.new(2017,10,2)
  expect(@traveller.searches.return_date).to match Date.new(2017,10,8)
end

Then(/^they see a list of return flights$/) do
  pending # Write code here that turns the phrase above into concrete actions
end