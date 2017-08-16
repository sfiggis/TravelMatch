class CreateTravellerCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :traveller_countries do |t|
      t.references :traveller
      t.references :country
      t.boolean :home
    end
  end
end
