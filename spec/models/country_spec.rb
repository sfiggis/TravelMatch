require 'rails_helper'

RSpec.describe Country, type: :model do
  describe "searching by budget" do
    before do
      @usa = Country.create!(name: "US", iso2: "US", iso3: "USA", itu: "USA", fips: "US", currency_code: "USD", currency: "US Dollar", capital: "Washington", continent: "NA", gdp_ppp: 57411.7873)
      @bermuda = Country.create!(name: "Bermuda", iso2: "BM", iso3: "BMU", itu: "BER", fips: "BD", currency_code: "BMD", currency: "Bermudian Dollar", capital: "Hamilton", continent: "NA", gdp_ppp: 52436.0564)
      @norway = Country.create!(name: "Norway", iso2: "NO", iso3: "NOR", itu: "NOR", fips: "NO", currency_code: "NOK", currency: "Norweigan Crone", capital: "Oslo", continent: "EU", gdp_ppp: 59301.6702)

    end

    it "sets a cost per day on the country in dollars" do
      expect(@usa.dollars_per_day).to eq 200.00
      expect(@bermuda.dollars_per_day).to eq 209.49
    end
  end

end