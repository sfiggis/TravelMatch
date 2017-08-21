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

  def home_country
    @home = self.traveller_countries.find_by(:home => true)
    unless @home.nil?
      @home_country = @home.country
    end
  end

  def currency
    unless self.home_country.nil?
      self.currency = @home_country.currency_code
    end
  end

  def home_update(new_country)
    unless home_country.nil?
      home_country.update(:home => false)
    end
    self.traveller_countries.create(country_id: new_country.id, home:true)
  end

end