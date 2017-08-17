class Country < ApplicationRecord
  has_many :traveller_countries
  has_many :countries, through: :traveller_countries

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
    percent_diff = ((self.gdp_ppp - 57411.7873) / self.gdp_ppp * 100)
    if percent_diff > 0
      dollars_per_day = (200.00 + percent_diff).round(2)
    elsif percent_diff < 0
      dollars_per_day = (200.00 - percent_diff).round(2)
    else
      dollars_per_day = 200.00
    end   
  end

  def cost_converter
    results = self.class.get('https://openexchangerates.org/api/latest.json', query: {
      app_id: Country.token,
    })
    body = JSON.parse(results.body)
    home_country = Country.find(Country.current_traveller.traveller_countries.find_by(home: true).country_id)
    exchange = body["rates"]["#{home_country.currency_code}"]
    cost_per_day = self.dollars_per_day * exchange
    cost_per_day.round(2)
  end

end