When(/^they are on the home page$/) do
  visit root_path
end

When(/^they are on their profile page$/) do
  visit root_path
end

When(/^they click on logout$/) do
  click_on 'Log Out'
end

Then(/^they are logged out as an admin$/) do
  expect(current_path).to eq new_admin_session_path
end

Then(/^they are logged out$/) do
  expect(current_path).to eq new_traveller_session_path
end