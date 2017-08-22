Given(/^they are on the sign up page$/) do
  visit new_traveller_registration_path
end

When(/^they enter their username$/) do
  fill_in 'Username', :with => 'test_username'
end

When(/^they enter their email$/) do
 fill_in 'Email', :with => 'test@example.com'
end

When(/^they enter their password$/) do
  fill_in 'Password', :with => 'password'
end

When(/^they confirm their password$/) do
  fill_in 'Password confirmation', :with => 'password'
end

When(/^they register$/) do
  click_on 'Sign up'
end

Then(/^they have a new account$/) do
  expect(Traveller.count).to eq 1
end

Then(/^they get sent to the homepage$/) do
  Traveller.first.skip_confirmation!
  Traveller.first.save
  page.set_rack_session('warden.user.traveller.key' => Traveller.serialize_into_session(current_traveller))
  expect(page.current_path).to eq '/'
end

Then(/^they see a message welcoming them into Travel Match$/) do
  expect(page).to have_content("Welcome to Travel Match!")
end

Then(/^they receive an email asking them to confirm their email address$/) do
  expect(ActionMailer::Base.deliveries.length).to eq 1
  expect(ActionMailer::Base.deliveries.first.subject).to match 'Welcome to Travel Match!'
end