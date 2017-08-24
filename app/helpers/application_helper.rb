module ApplicationHelper

  def country_profile_image
    if @country.images.empty?
      "/city_fullsize.jpeg"
    else
      @country.images.first.image_url(:original)
    end
  end

  def airport_profile_image
    if @airport.images.empty?
      "/city_fullsize.jpeg"
    else
      @airport.images.first.image_url(:original)
    end
  end
end
