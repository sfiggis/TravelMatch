class CreateCountry < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso2
      t.string :iso3
      t.string :itu
      t.string :fips
      t.string :currency_code
      t.string :currency_name
      t.string :capital
      t.string :continent
      t.float :gdp_ppp
    end
  end
end
