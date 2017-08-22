class TravellersController < ApplicationController
  before_action :authenticate_traveller!
  before_action :find_traveller, only: [:show, :edit, :update]

  def show
    @home_country = Country.find_by(id: @traveller.home_location_id)
  end

  def edit
  end

  def update
    @country = Country.find(traveller_params[:country_ids])
    @traveller.update(home_location_id: @country.id, currency_code: @country.currency_code)
    @traveller.save
    redirect_to traveller_path(@traveller)
  end

  private
  def traveller_params
    params.require(:country).permit(:country_ids)
  end

  def find_traveller
    @traveller = Traveller.find(params[:id])
  end
end