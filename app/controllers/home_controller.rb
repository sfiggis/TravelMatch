class HomeController < ApplicationController
  def index
    # @traveller = current_traveller
    @traveller = Traveller.first
  end

end