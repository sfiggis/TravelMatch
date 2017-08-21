class AddBudgetToSearch < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :budget, :integer
  end
end
