class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :campaign
      t.string :address
      t.string :status, default: 'available', null: false
      t.timestamps
    end
  end
end
