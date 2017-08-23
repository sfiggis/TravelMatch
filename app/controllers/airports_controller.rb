class AirportsController < ApplicationController
  def edit
    @airport = Airport.find(params[:id])
    @image = @airport.images.build
  end

  def update
    @airport = Airport.find(params[:id])
    @airport.update(airport_params)
    @airport.save
    redirect_to airport_path(@airport)
  end

  def show
    @airport = Airport.find(params[:id])
    @images = @airport.images
    @image_urls = []
    @airport.images.each do | image |
      @image_url = ImageUploader::Attacher.new(image, :image)
      @image_urls << @image_url.url(:small) unless @image_url.url(:small).nil?
    end
    # binding.pry
    respond_to do |format|
      format.json  { render :json => @airport.as_json.merge(images: @image_urls) }
      format.html
    end
  end

  def get_flights
    @airport = Airport.find(params[:id])
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
    @capital_flights = @country.airports.find_by(iso2: @country.iso2)
    if params[:search_id]
      @search = Search.find(params[:search_id])
    else
      @search = current_traveller.searches.new
    end
    @capital_flights.get_flights(@search, current_traveller)
    @capital_flights.flight_results
    @capital_flights.save
    respond_to do |format|
      format.json  { render :json => @capital_flights.to_json(methods: [:flight_results])}
    end
  end

  private
  def airport_params
    params.require(:airport).permit(:content, :images_attributes => [:image])
  end
end