class Country < ApplicationRecord
  has_many :traveller_countries
  has_many :countries, through: :traveller_countries
end