class AddContentToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :content, :text
  end
end
