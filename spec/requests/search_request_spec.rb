require "rails_helper"

RSpec.describe "SearchRequest", :type => :request do
  describe "search api request" do
    let!(:traveller) { create(:traveller) }
    let!(:country) { create(:country) }
      before do
      @search = traveller.searches.create!
      Search.exchange_rate_token = "12345"
        stub_request(:get, "https://openexchangerates.org/api/latest.json?app_id=12345").
        with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: File.read("spec/exchange_rates.json"), headers: {})
      Search.token = "12345"
        stub_request(:get, "http://api.travelpayouts.com/v1/prices/cheap?currency=NOK&departure_date=2017-11-01&format=json&origin=MOW&return_date=2017-11-03&token=12345").
         with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(status: 200, body: File.read("spec/travel_payouts/cheapest_flights.json"), headers: {})
     end
    it "creates a search and routes" do
      # login_as traveller, scope: :traveller
      put "/searches/#{@search.id}", :params => { search: { departureDate: Date.new(2017,11, 01), returnDate: Date.new(2017,11, 03), origin: "MOW", traveller_id: traveller.id, budget: 300}, session: {:current_traveller => traveller.id} }
      expect(traveller.searches.count).to eq 1
      expect(traveller.searches.first.return_date).to match Date.new(2017,11, 03)
    end

    it "finds destinations that fit search budget and are capitals" do
      put "/searches/#{@search.id}", :params => { search: { departureDate: Date.new(2017,11, 01), returnDate: Date.new(2017,11, 03), origin: "MOW", traveller_id: traveller.id, budget: 1000}, session: {:current_traveller => traveller.id}}
      expect(traveller.searches.first.destination_results).not_to be_empty
    end
  end
end
