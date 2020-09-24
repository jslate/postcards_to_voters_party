class AddCampaignIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :campaign_id, :integer, null: false
  end
end
