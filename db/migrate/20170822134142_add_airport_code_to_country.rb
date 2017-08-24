class AddAirportCodeToCountry < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :airport_code, :string
  end
end
