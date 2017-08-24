class AddColumnsToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :latitude, :float
    add_column :countries, :longitude, :float
  end
end
