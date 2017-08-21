class CreateAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :airport_type
      t.float :latitude
      t.float :longitude
      t.float :elevation
      t.string :continent
      t.string :iso2
      t.string :iso_region
      t.string :municipality
      t.string :scheduled_service
      t.string :gps_code
      t.string :iata_code
      t.string :local_code
      t.string :home_link
      t.string :wikipedia_link
      t.string :keywords
      t.references :country
    end
  end
end
