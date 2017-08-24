class Search < ApplicationRecord
  belongs_to :traveller
  has_many :search_airports
  has_many :airports, through: :search_airports
  scope :filter_by_traveller, ->(traveller_id) { where traveller_id: traveller_id }
  scope :budget, -> (budget) { where budget: budget }
  scope :origin, -> (origin) { where origin: origin }

  include HTTParty

  def journey_length
    length = (self.return_date - self.departure_date).to_i
  end

  def daily_budget
    unless self.budget.nil?
      daily_budget = (self.budget / journey_length)
    end
  end

  def self.token=(token)
    @token = token
  end

  def self.token
    @token
  end

  def destination_results
    unless budget.nil?
      countries = Country.all.select{ |country| country.in_budget?(self) }
    end
  end

  def flight_results
    unless self.origin.nil?
      results = self.class.get('http://api.travelpayouts.com/v1/prices/cheap', query: {
        origin: self.origin,
        departure_date: self.departure_date,
        return_date: self.return_date,
        token: Search.token,
        format: :json,
        currency: self.traveller.currency
        })
      body = JSON.parse(results.body)
      body["data"].map do |destination_ids|
        destination_ids[1].sort_by { |k, v| v["price"] }
        @airport = Airport.find_by(iata_code: destination_ids[0])
        unless @airport.nil?
          @airport_city = @airport.municipality
        end
        routes = []
        destination_ids[1].map do |route_ids|
          @route = {
            price: route_ids[1]["price"],
            airline: route_ids[1]["airline"],
            flight_number: route_ids[1]["flight_number"],
            departure_at: Date.parse(route_ids[1]["departure_at"]).strftime('%a %d %b %Y'),
            return_at: Date.parse(route_ids[1]["return_at"]).strftime('%a %d %b %Y'),
            expires_at: route_ids[1]["expires_at"],
            destination_code: @airport_city,
            currency: body["currency"],
            search_id: self.id
          }
        end
        routes << @route
      end
    end
  end
end