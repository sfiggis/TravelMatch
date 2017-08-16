class TravellersController < ApplicationController
  before_action :authenticate_traveller!
  before_action :find_traveller, only: [:show, :edit, :update]

  def show
    @home_country = Country.find(@traveller.traveller_countries.find_by(home: true).country_id)
  end

  def edit
  end

  def update
    @country = Country.find(traveller_params[:country_ids])
    @traveller.update(traveller_params)
    @home = @traveller.traveller_countries.where(country_id: @country.id)
    @home.update(home: true)
    redirect_to traveller_path(@traveller)
  end

  private
  def traveller_params
    params.require(:country).permit(:country_ids)
  end

  def find_traveller
    @traveller = Traveller.find(params[:id])
  end

  def find_home_country
  end
end