class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :destination_code
      t.integer :price
      t.string :airline
      t.integer :flight_number
      t.date :departure_at
      t.date :return_at
      t.string :currency
      t.date :expires_at
      t.references :search
    end
  end
end
