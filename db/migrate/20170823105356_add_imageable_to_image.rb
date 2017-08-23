class AddImageableToImage < ActiveRecord::Migration[5.1]
  def change
    change_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
