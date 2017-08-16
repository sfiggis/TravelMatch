class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :origin
      t.date :departure_date
      t.date :return_date
      t.references :traveller
    end
  end
end
