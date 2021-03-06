require 'rails_helper'

RSpec.describe Search, type: :model do

  before do
    Search.token = "12345"
  end

  describe "travel routes by date" do
    let!(:traveller) { create(:traveller) }
    before do
      stub_request(:get, "http://api.travelpayouts.com/v1/prices/cheap?currency=NOK&departure_date=2017-11-01&format=json&origin=MOW&return_date=2017-12-01&token=12345").
         with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(status: 200, body: File.read("spec/travel_payouts/cheapest_flights.json"), headers: {})
      @search = traveller.searches.new(origin: "MOW", departure_date: Date.new(2017,11, 01), return_date: Date.new(2017,12, 01))
      @results = @search.flight_results
      @result = @results.first
    end

    it "loads 100 flights" do
      expect(@results.length).to eq(41)
    end
  end

  describe "travel routes by budget" do
    let!(:traveller) { create(:traveller) }

    before do
      @search = traveller.searches.create!(origin: "MOW", departure_date: Date.new(2017,11, 01), return_date: Date.new(2017,11, 03), budget: 1000)
      @bermuda = Country.find_or_create_by(name: "Bermuda", iso2: "BM", iso3: "BMU", itu: "BER", fips: "BD", currency_code: "BMD", currency_name: "Bermudian Dollar", capital: "Hamilton", continent: "NA", gdp_ppp: 52436.0564)

    end
    it "gets a journey length from the search dates" do
      expect(@search.journey_length).to eq 2
    end

    it "gets a daily budget from the journey length and budget amount" do
      expect(@search.daily_budget).to eq 500
    end

    it "finds airports that match the budget criteria" do
       expect(@search.destination_results.count).to be > 0
     end

    # it "loads flights for top destinations" do
    # end
  end
end