class SearchAirport < ApplicationRecord
  belongs_to :search
  belongs_to :airport
end