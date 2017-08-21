Given(/^they are logged in$/) do
  page.set_rack_session('warden.user.traveller.key' => Traveller.serialize_into_session(@traveller))
end

Given(/^they are on the search page$/) do
  visit '/'
end

When(/^they fill in the departure date$/) do
  within "#search" do
    fill_in 'departureDate', :with => Date.new(2017,10,2)
  end
end

When(/^they fill in the origin$/) do
  within "#search" do
    fill_in 'origin', :with => "LON"
  end
end

When(/^they fill in the return date$/) do
  within "#search" do
    fill_in 'returnDate', :with => Date.new(2017,10,8)
  end
end

When(/^they click the search button$/) do
  find_button('Quick Search').trigger('click')
end

When(/^they have saved a search and routes$/) do
  # @search = @traveller.searches.create!(origin: "LON", departure_date: Date.new(2017,10,2), return_date: Date.new(2017,10,8))
  # @search.routes.create!(
  #   # price: 12345,
    # airline: "N4",
    # flight_number: 225,
    # departure_at: "2017-10-01T16:45:00Z",
    # return_at: "2017-12-01T12:45:00Z",
    # destination_code: "ETH",
    # currency: "RUB")
end

# When(/^they are taken to the search page$/) do
#   visit search_path(@search)
# end


Then(/^they see a list of searches$/) do
  page.find('#searchButton').trigger('click')
   expect(page).to have_content("ETH")
  expect(page).to have_content("RUB")
  expect(@traveller.searches.count).to eq 1
  expect(@traveller.searches.departure_date).to match Date.new(2017,10,2)
  expect(@traveller.searches.return_date).to match Date.new(2017,10,8)
end

Then(/^they see a list of return flights$/) do
end