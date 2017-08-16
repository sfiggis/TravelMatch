class TravellerCountry < ApplicationRecord
  belongs_to :traveller
  belongs_to :country
end