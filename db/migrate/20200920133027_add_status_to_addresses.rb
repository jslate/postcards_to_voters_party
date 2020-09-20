class AddStatusToAddresses < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE address_status AS ENUM ('available', 'in_use', 'completed');
    SQL
    add_column :addresses, :status, :address_status, default: 'available'
  end

  def down
    remove_column :addresses, :status
    execute <<-SQL
      DROP TYPE address_status;
    SQL
  end
end
