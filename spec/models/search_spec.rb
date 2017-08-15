require 'rails_helper'

RSpec.describe Search, type: :model do

  before do
    Search.api_key = "12345"
  end

  describe "travel routes by date" do
    before do
      stub_request(:get, "http://api.travelpayouts.com/v1/prices/cheap?departure_date=2017-11-01&format=json&origin=MOW&return_date=2017-12-01&token=12345&limit=100").
         with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(status: 200, body: File.read("spec/travel_payouts/cheapest_flights.json"), headers: {})

      @search = Search.new(origin: "MOW", departure_date: Date.new(2017,11, 01), return_date: Date.new(2017,12, 01))
      @results = @search.results
      @result = @results.first
    end

    it "loads 100 flights" do
      expect(@results.length).to eq(41)
      expect(@result.all? {|result| result.is_a?(Route)}).to eq true
      expect(@result.first.flight_number).to eq 225
    end
  end
end