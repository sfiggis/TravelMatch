class Traveller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username, uniqueness: true

  has_many :searches
  has_many :traveller_countries
  has_many :countries, through: :traveller_countries
  accepts_nested_attributes_for :countries

end