Given(/^they are registered as an admin$/) do
  @admin = Admin.new(username: "joey_blogger", email: "email@example.co.uk", password: "password", password_confirmation: "password")
  @admin.skip_confirmation!
  @admin.save!
end

Given(/^they are on the admin sign in page$/) do
  visit new_admin_session_path
end

When(/^they fill in their admin email$/) do
  fill_in 'Email', :with => 'email@example.co.uk'
end

When(/^they fill in their admin password$/) do
  fill_in 'Password', :with => 'password'
end

When(/^they click the admin sign in button$/) do
  click_on "Log in"
end

Then(/^they are signed in as an admin$/) do
  expect(page).to have_content("Signed in successfully")
end