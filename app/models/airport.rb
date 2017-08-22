class Airport < ApplicationRecord
  belongs_to :country, optional: true
  has_many :search_airports
  has_many :searches, through: :search_airports

  include HTTParty

  def get_flights(search)
    if search.traveller.currency_code   
      @currency = search.traveller.currency_code
    else
      @currency = "USD"
    end
    results = self.class.get('http://api.travelpayouts.com/v1/prices/cheap', query: {
      origin: search.origin,
      destination: self.iata_code,
      depart_date: search.departure_date,
      return_date: search.return_date,
      token: "de802dc5fcdd7bdd866adf7001fc06df",
      format: :json,
      currency: @currency
    })
    body = JSON.parse(results.body)
    binding.pry
    body["data"].map do |destination_ids|
      destination_ids[1].sort_by { |k, v| v["price"] }
      routes = []
      destination_ids[1].map do |route_ids|
        @route = {
          price: route_ids[1]["price"],
          airline: route_ids[1]["airline"],
          flight_number: route_ids[1]["flight_number"],
          departure_at: route_ids[1]["departure_at"],
          return_at: route_ids[1]["return_at"],
          expires_at: route_ids[1]["expires_at"],
          destination_code: self.municipality,
          currency: body["currency"],
          search_id: search.id
        }
      end
        routes << @route
    end

  end
end