When(/^they click the match button$/) do
  within "#button-wrapper" do
    page.find('#matchLink').trigger('click')
  end
end

When(/^they choose a budget range$/) do
  fill_in 'budget', with: 1000
  click_on 'Match'
end

When(/^they click the second match button$/) do
  within "#match-wrapper" do
    page.find("#matchButton").trigger('click')
  end
end

Then(/^they have a new search with a budget range$/) do
  expect(@traveller.searches.count).to eq 1
  expect(@traveller.searches.first.budget).to eq 1000
end