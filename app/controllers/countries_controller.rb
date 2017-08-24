class CountriesController < ApplicationController
  layout 'countries/main', only: [:show]
  def edit
    @country = Country.find(params[:id])
    @image = @country.images.build
  end

  def update
    @country = Country.find(params[:id])
    @country.update(country_params)
    if @country.save
      redirect_to country_path(@country)
    else
      render :edit
    end
  end

  def create
    @country = Country.new(country_params)
    Country.current_traveller = Traveller.find(session_params[:current_traveller])
    @country.save
  end

  def show
    if params[:search]
      @search = Search.find(params[:search])
    end
    @country = Country.find(params[:id])
    @airports = @country.airports.where("municipality is NOT NULL and municipality != ''")
    @capital_flights = @airports.where(iata_code: @country.airport_code)
    @images = @country.images
  end

  private

  def session_params
    params.require(:session).permit(:current_traveller)
  end

  def country_params
    params.require(:country).permit(:name, :iso2, :iso3, :itu, :fips, :currency_code, :currency, :capital, :continent, :gdp_ppp, :content, :images_attributes => [:image])
  end
end