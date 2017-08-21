require 'pry'
class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:update, :update_matches]
  before_action :find_search, only: [:update, :update_matches]
  def show
    @search = Search.find(params[:id])
    respond_to do |format|
      format.json  { render :json => @search.to_json(methods: [:flight_results])}
    end
  end

  def matches
    @search = Search.find(params[:id])
    respond_to do |format|
      format.json  { render :json => @search.to_json(methods: [:destination_results])}
    end
    # response = @search.flight_results
  end

  def update_matches
    binding.pry
    @search.update(search_params)
    if search_params[:budget].present?
      @search.destination_results
    end
    @search.save
    render 'matches'
  end

  def update
    @search.update(search_params)
    response = @search.flight_results
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