require "rails_helper"

RSpec.describe "SearchRequest", :type => :request do
  describe "search api request" do
    before do
      @traveller = Traveller.create!(first_name: "Jimmy", last_name: "fixit", username: "jimbo", email: "fixing@example.co.uk", password: "password", password_confirmation: "password")
      @norway = Country.create!(name: "Norway", iso2: "NO", iso3: "NOR", itu: "NOR", fips: "NO", currency_code: "NOK", currency: "Norweigan Crone", capital: "Oslo", continent: "EU", gdp_ppp: 59301.6702)
      @usa = Country.new(name: "US", iso2: "US", iso3: "USA", itu: "USA", fips: "US", currency_code: "USD", currency: "US Dollar", capital: "Washington", continent: "NA", gdp_ppp: 57411.7873)
      @bermuda = Country.create!(name: "Bermuda", iso2: "BM", iso3: "BMU", itu: "BER", fips: "BD", currency_code: "BMD", currency: "Bermudian Dollar", capital: "Hamilton", continent: "NA", gdp_ppp: 52436.0564)
      @traveller.traveller_countries.create!(country_id: @norway.id, home: true)
      post '/countries', :params => {:country => {name: "Bermuda", iso2: "BM", iso3: "BMU", itu: "BER", fips: "BD", currency_code: "BMD", currency: "Bermudian Dollar", capital: "Hamilton", continent: "NA", gdp_ppp: 52436.0564}, session: {:current_traveller => @traveller.id} }
      Country.token = "12345"

      stub_request(:get, "https://openexchangerates.org/api/latest.json?app_id=12345").
         with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(status: 200, body: File.read("spec/exchange_rates.json"), headers: {})
       end

    it "sets converts cost in dollars to user's currency" do
      expect(@traveller.traveller_countries.count).to eq 1
      expect(@bermuda.cost_converter).to eq 1662.69
    end
  end
end