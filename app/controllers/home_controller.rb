class HomeController < ApplicationController
  def index
    if traveller_signed_in?
      @traveller = current_traveller
      @search = @traveller.searches.create
    end
  end

end