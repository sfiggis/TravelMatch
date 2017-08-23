
When(/^they upload an image for the destination$/) do
  attach_file 'Image', File.join(Rails.root, 'features', 'support', 'upload-files', 'bermuda_test.jpg')
end

Then(/^the admin is redirected to the airport show page$/) do
  expect(page.current_path).to eq airport_path(@airport)
end

Then(/^the destination has an image$/) do
  save_and_open_page
  @image = @destination.images.first
  @image = JSON.parse(@image.image_data)["original"]["id"]
  expect(page).to have_css("img[src*='#{@image}']")
end