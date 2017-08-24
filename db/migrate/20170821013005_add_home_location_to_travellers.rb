class AddHomeLocationToTravellers < ActiveRecord::Migration[5.1]
  def change
    add_column :travellers, :home_location_id, :integer
  end
end
