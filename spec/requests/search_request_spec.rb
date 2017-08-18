require "rails_helper"

RSpec.describe "SearchRequest", :type => :request do
  describe "search api request" do
    before do
      @traveller = Traveller.new(first_name: "Joe", last_name: "Bloggs", username: "joey_blogger", email: "email@example.co.uk", password: "password", password_confirmation: "password")
      @traveller.skip_confirmation!
      @traveller.save!
      @norway = Country.create!(name: "Norway", iso2: "NO", iso3: "NOR", itu: "NOR", fips: "NO", currency_code: "NOK", currency_name: "Norweigan Crone", capital: "Oslo", continent: "EU", gdp_ppp: 59301.6702)
      @traveller.traveller_countries.create!(country_id: @norway.id, home: true)
      Country.token = "12345"
        stub_request(:get, "https://openexchangerates.org/api/latest.json?app_id=12345").
        with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: File.read("spec/exchange_rates.json"), headers: {})
      Search.api_key = "12345"
         stub_request(:get, "http://api.travelpayouts.com/v1/prices/cheap?departure_date=2017-11-01&format=json&limit=100&origin=MOW&return_date=2017-11-03&token=12345").
         with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(status: 200, body: File.read("spec/travel_payouts/cheapest_flights.json"), headers: {})
    end
    it "creates a search and routes" do
      post "/searches", :params => { search: { departureDate: Date.new(2017,11, 01), returnDate: Date.new(2017,11, 03), origin: "MOW", travellerId: @traveller.id, budget: 300} }
      expect(Search.count).to eq 1
      expect(Search.first.routes.count).to be > 0
    end

    it "finds destinations that fit search budget and are capitals" do
      post "/searches", :params => { search: { departureDate: Date.new(2017,11, 01), returnDate: Date.new(2017,11, 03), origin: "MOW", travellerId: @traveller.id, budget: 300}}
      expect(Search.count).to eq 1
      expect(Search.first.airports.count).to be > 0
    end
  end
end
