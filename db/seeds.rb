require 'pry'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

country_codes = CSV.read(Rails.root.join('data_files/country.csv'))
airports = CSV.read(Rails.root.join('data_files/airports.csv'))


airports_list = []
airports.each do |airport|
  if airport[2] == "large_airport" && airport[10] != '' && airport[16] != ''
    airports_list << airport
  end
end

airports_list.each do |airport|
  Airport.find_or_create_by(name: airport[3], latitude: airport[4], longitude: airport[5], elevation: airport[6], continent: airport[7], iso2: airport[8], iso_region: airport[9], municipality: airport[10], iata_code: airport[13], wikipedia_link: airport[16])
end

 country_codes.each_with_index do |country, index|
   @country = Country.find_or_create_by(name: country[0], iso2: country[1], iso3: country[2], itu: country[3], fips: country[4], currency_code: country[5], currency_name: country[6], capital: country[7], continent: country[8], gdp_ppp: country[11], airport_code: country[12])
   @country.airports << Airport.where(iso2: @country.iso2)
 end


