Given(/^they are on the admin sign up page$/) do
  visit new_admin_registration_path
end

Given(/^they enter their admin email$/) do
  fill_in 'Email', :with => 'test@test.com'
end

Given(/^they enter their admin password$/) do
  fill_in 'Password', :with => "password"
end

Given(/^they confirm their admin password$/) do
  fill_in 'Password confirmation', :with => "password"
end

When(/^they register as an admin$/) do
  click_on 'Sign up'
end

Then(/^they get sent to the admin page$/) do
   expect(page.current_path).to eq '/'
end

Then(/^they have a new admin account$/) do
  expect(Admin.count).to eq 1
end

Then(/^they see a message welcoming them into Travel Match as an admin$/) do
  expect(page).to have_content("Welcome to Travel Match!")
end

Then(/^they receive an email asking them to confirm their admin email address$/) do
  expect(ActionMailer::Base.deliveries.length).to eq 1
  expect(ActionMailer::Base.deliveries.first.subject).to match 'Welcome to Travel Match!'
end