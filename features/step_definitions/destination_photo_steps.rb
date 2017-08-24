
When(/^they upload an image for the destination$/) do
  attach_file 'Image', File.join(Rails.root, 'features', 'support', 'upload-files', 'bermuda_test.jpg')
end

Then(/^the admin is redirected to the airport show page$/) do
  expect(page.current_path).to eq airport_path(@destination)
end

Then(/^the destination has an image$/) do
  expect(@destination.images.count).to eq 1
end