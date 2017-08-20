require 'pry'
class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :update
  before_action :find_search, only: [:update]
  respond_to :json
  def show
    @search = Search.find(params[:id])
    respond_to do |format|
      format.json  { render :json => @search.to_json(methods: [:flight_results, :destination_results])}
    end
  end

  def create

  end

  def update
    @search.update(search_params)
    # filtering_params(search_params).each do |key, value|
    #   @search.destination_results(value) if value.present?
    # end
    if search_params[:budget].present?
      @search.destination_results
      response = @search.flight_results
    end
    @search.save
    render json: @search
  end

  private
  def search_params
    params.require(:search).permit(:departureDate, :returnDate, :travellerId, :origin, :budget, :traveller_id).transform_keys { |k| k.underscore }
  end

  def find_search
    @search = Search.find(params[:id])
  end

  def current_traveller
    @traveller = Traveller.find(params[:traveller_id])
  end

    def filtering_params(params)
    sliced_params = params.slice(:budget, :origin, :departureDate, :returnDate)
  end
end