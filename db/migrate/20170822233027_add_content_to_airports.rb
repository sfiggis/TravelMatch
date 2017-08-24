class AddContentToAirports < ActiveRecord::Migration[5.1]
  def change
    add_column :airports, :content, :text
  end
end
