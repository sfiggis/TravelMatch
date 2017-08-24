class Airport < ApplicationRecord
  belongs_to :country, optional: true
  has_many :search_airports
  has_many :searches, through: :search_airports
  has_many :images, :as => :imageable, dependent: :destroy
  accepts_nested_attributes_for :images

  include HTTParty

  def flight_results
    @routes
  end

  def self.token=(token)
    @token = token
  end

  def self.token
    @token
  end

  def get_flights(search, current_traveller)
    if search.traveller.currency_code   
      @currency = search.traveller.currency_code
    else
      @currency = "USD"
    end

    if search.origin
      @origin = Country.find_by(airport_code: search.origin)
      @origin = @origin.airport_code
    elsif current_traveller.home_location_id
      @home = Country.find(current_traveller.home_location_id)
      @origin = @home.iso2
    else
       @origin = 'LON'
    end
    results = self.class.get('http://api.travelpayouts.com/v1/prices/monthly', query: {
      origin: @origin,
      destination: self.iso2,
      token: Airport.token,
      format: :json,
      currency: @currency
    })
    body = JSON.parse(results.body)
    @routes = []
    body["data"].map do |destination_ids|
      @city = Airport.find_by(iata_code: destination_ids[1]["destination"])
      if @city.nil?
        @city = destination_ids[1]["destination"]
      else
        @city = @city.municipality
      end
      @route = {
        month: destination_ids[0],
        price: destination_ids[1]["price"],
        airline: destination_ids[1]["airline"],
        flight_number: destination_ids[1]["flight_number"],
        departure_at: Date.parse(destination_ids[1]["departure_at"]).strftime('%a %d %b %Y'),
        return_at: Date.parse(destination_ids[1]["return_at"]).strftime('%a %d %b %Y'),
        transfers: destination_ids[1]["transfers"],
        expires_at: destination_ids[1]["expires_at"],
        destination_code: @city,
        currency: body["currency"],
        search_id: search.id
      }
      @routes << @route
    end

  end
end