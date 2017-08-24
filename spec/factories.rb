FactoryGirl.define do

  factory :country do
    name "Norway"
    iso3 "NOR"
    currency_code "NOK"
    currency_name "Norweigan Crone"
    gdp_ppp 59301.6702
    id 1000
  end
end
FactoryGirl.define do
  factory :traveller do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    currency 'NOK'
    home_location_id 1000
    id 1
  end
end