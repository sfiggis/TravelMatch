class Search < ApplicationRecord
  belongs_to :traveller
  has_many :routes
  scope :filter_by_traveller, ->(traveller_id) { where traveller_id: traveller_id }

  include HTTParty

  def self.api_key=(api_key)
    @api_key = api_key
  end

  def self.api_key
    @api_key
  end

  def results
    results = self.class.get('http://api.travelpayouts.com/v1/prices/cheap', query: {
      origin: self.origin,
      departure_date: self.departure_date,
      return_date: self.return_date,
      token: Search.api_key,
      format: :json,
      limit: 100
      })
    body = JSON.parse(results.body)
    body["data"].map do |destination_ids|
      destination_ids[1].map do |route_ids|
        route = self.routes.new(
          price: route_ids[1]["price"],
          airline: route_ids[1]["airline"],
          flight_number: route_ids[1]["flight_number"],
          departure_at: route_ids[1]["departure_at"],
          return_at: route_ids[1]["return_at"],
          expires_at: route_ids[1]["expires_at"],
          destination_code: destination_ids[0],
          currency: body["currency"],
          search_id: self.id
        )
      end
    end
  end
end