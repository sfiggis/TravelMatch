require 'pry'
class SearchesController < ApplicationController
  def show
    @search = Search.find(params[:id])
    # render json: @search
  end
  def create
    Country.current_traveller = find_traveller
    @search = Search.new(search_params)
    destinations = @search.destination_results(search_params[:budget])
    response = @search.flight_results
    @search.save
    # redirect_to search_path(@search)
    render "show"
  end

  private
  def search_params
    params.require(:search).permit(:departureDate, :returnDate, :travellerId, :origin, :budget, :traveller_id).transform_keys { |k| k.underscore }
  end

  def find_search
    @search = Search.find(params[:id])
  end

  def find_traveller
    Traveller.find(params[:search][:travellerId])
  end
end