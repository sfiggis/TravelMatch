class HomeController < ApplicationController
  def index
    binding.pry
    @traveller = current_traveller
    @search = @traveller.searches.create
  end

# def current_traveller
#   current_traveller ||= Traveller.first if Rails.env.test?
# end

end