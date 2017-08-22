class AirportsController < ApplicationController

  def show
    binding.pry
    @airport = Airport.find(params[:airport_id])
    respond_to do |format|
      format.json  { render :json => @airport.to_json(data: @flights.to_json)}
    end
  end

  def update
    @airport = Airport.find(params[:airport_id])
    if params[:search_id]
      @search = Search.find(params[:search_id])
      @flights = @airport.get_flights(@search)
      @airport.save
    end
    respond_to do |format|
      format.json  { render :json => @airport.to_json(data: @flights.to_json)}
    end
  end
end