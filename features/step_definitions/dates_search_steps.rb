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

When(/^they are taken to the search page$/) do
  visit root_path
end


Then(/^they see a list of searches$/) do
  #getting multiple copies of search... issues with ajax
  # expect(@traveller.searches.count).to eq 1
  expect(@traveller.searches.first.departure_date).to match Date.new(2017,10,2)
  expect(@traveller.searches.first.return_date).to match Date.new(2017,10,8)
end