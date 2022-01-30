class AddInUseUserToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :in_use_user, foreign_key: { to_table: :users }
  end
end
