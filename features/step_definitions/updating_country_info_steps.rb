Given(/^they are already signed in as an admin$/) do
  page.set_rack_session('warden.user.admin.key' => Admin.serialize_into_session(@admin))
end


When(/^they are on the edit country page$/) do
  visit edit_country_path(@country)
end

When(/^they add a description for the country$/) do
  @text = "The goal is to cultivate in our hearts the concern a dedicated mother feels for her child, and then focus it on more and more people and living beings. This is a heartfelt, powerful love. Such feelings give us a true understanding of human rights, that is not grounded just in legal terms, but rooted deeply in the heart."
  fill_in 'Content', with: @text
end

When(/^they click update$/) do
  click_on 'Update'
end

Then(/^the country has content$/) do
  @country.reload
  expect(@country.content).to eq @text
end

Then(/^the admin is redirected to the country show page$/) do
  expect(page.current_path).to eq country_path(@country)
end