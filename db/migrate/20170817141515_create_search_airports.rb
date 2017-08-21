class CreateSearchAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :search_airports do |t|
      t.references :search
      t.references :airport
    end
  end
end
