class Country < ApplicationRecord
  has_many :traveller_countries
  has_many :travellers, through: :traveller_countries
  accepts_nested_attributes_for :travellers
  has_many :airports

  include HTTParty

  def self.token=(token)
    @token = token
  end

  def self.token
    @token
  end

  def self.current_traveller=(traveller)
    @current_traveller = traveller
  end

  def self.current_traveller
    @current_traveller
  end

  def dollars_per_day
    unless self.gdp_ppp.nil?
      percent_diff = ((self.gdp_ppp - 57466.7871132348) / 57466.7871132348 * 100)
      dollars_per_day = (200.00 + percent_diff).round(2) 
    end
  end

  def cost_converter
    results = self.class.get('https://openexchangerates.org/api/latest.json', query: {
      app_id: Country.token,
    })
    body = JSON.parse(results.body)
    home_country = Country.find(Country.current_traveller.traveller_countries.find_by(home: true).country_id)
    # not sure this is right = exhange not touchiing current country choice?
    exchange = body["rates"]["#{home_country.currency_code}"]
    cost_per_day = self.dollars_per_day * exchange
    cost_per_day.round(2)
  end

end