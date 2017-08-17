When(/^they choose a budget range$/) do
  save_and_open_page
  within "#search" do
    fill_in 'budget', with: 1000
  end
end

Then(/^they have a new search with a budget range$/) do
  expect(@traveller.searches.count).to eq 1
  expect(@traveller.searches.first.budget).to eq 1000
end

After('@javascript') do
  wait_until { page.evaluate_script('$.active') == 0 } if Capybara.current_driver == :poltergeist
  page.has_content? ''
end