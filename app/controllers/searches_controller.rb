require 'pry'
class SearchesController < ApplicationController
  def show
    @search = Search.find(params[:id])
    # render json: @search
  end
  def create
    @search = Search.new(search_params)
    response = @search.results
    @search.save
    redirect_to search_path(@search)
  end

  private
  def search_params
    params.require(:search).permit(:departureDate, :returnDate, :travellerId, :origin).transform_keys { |k| k.underscore }
  end

  def find_search
    @search = Search.find(params[:id])
  end
end