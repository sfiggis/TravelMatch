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
    else
      @search = current_traveller.searches.new
    end
    @flights = @airport.get_flights(@search)
    @airport.save
    respond_to do |format|
      format.json  { render :json => @airport.to_json(data: @flights.to_json)}
    end
  end

  def capital_update
    @country = Country.find(params[:country_id])
    binding.pry
    @capital_flights = @country.airports.find_by(iso2: @country.iso2)
    if params[:search_id]
      @search = Search.find(params[:search_id])
    else
      @search = current_traveller.searches.new
    end
    @capital_flights.get_flights(@search)
    @capital_flights.flight_results
    @capital_flights.save
    respond_to do |format|
      format.json  { render :json => @capital_flights.to_json(methods: [:flight_results])}
    end
  end
end