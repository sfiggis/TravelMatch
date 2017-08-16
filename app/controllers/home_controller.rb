class HomeController < ApplicationController
  def index
    @traveller = Traveller.first
  end

end