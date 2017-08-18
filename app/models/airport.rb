class Airport < ApplicationRecord
  belongs_to :country, optional: true
  has_many :search_airports
  has_many :searches, through: :search_airports
end