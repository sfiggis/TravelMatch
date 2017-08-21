Given(/^they are registered$/) do
  @traveller = Traveller.new(first_name: "Joe", last_name: "Bloggs", username: "joey_blogger", email: "email@example.co.uk", password: "password", password_confirmation: "password")
  @traveller.skip_confirmation!
  @traveller.save!
end

Given(/^they are on the sign in page$/) do
  visit new_traveller_session_path
end

When(/^they fill in their username$/) do
  fill_in 'Email', :with => 'email@example.co.uk'
  end

When(/^they fill in their password$/) do
  fill_in 'Password', :with => 'password'
end

When(/^they click the sign in button$/) do
  click_on "Log in"
end

Then(/^they are signed in$/) do
  expect(page).to have_content("Signed in successfully")
end

Then(/^they are on the homepage$/) do
  expect(page.current_path).to eq root_path
end