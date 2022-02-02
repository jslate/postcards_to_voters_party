class AddPendingToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pending, :boolean, null: false, default: true
  end
end
