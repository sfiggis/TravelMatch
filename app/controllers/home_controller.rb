class HomeController < ApplicationController
  def index
    @traveller = Traveller.first
    @search = @traveller.searches.create
  end

end