When(/^they upload an image for the country$/) do
  attach_file 'Image', File.join(Rails.root, 'features', 'support', 'upload-files', 'bermuda_test.jpg')
end

Then(/^the country has an image$/) do
  expect(@country.images.count).to eq 1
end

Then(/^the image is displayed on the page$/) do
  @image = @country.images.first
  @image = JSON.parse(@image.image_data)["original"]["id"]
  expect(page).to have_css("img[src*='#{@image}']")
end