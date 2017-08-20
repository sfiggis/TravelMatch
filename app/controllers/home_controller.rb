class HomeController < ApplicationController
  def index
    @traveller = current_traveller
    @search = @traveller.searches.create
  end

end