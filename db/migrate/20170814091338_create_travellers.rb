class CreateTravellers < ActiveRecord::Migration[5.1]
  def change
    create_table :travellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :currency
    end
  end
end
