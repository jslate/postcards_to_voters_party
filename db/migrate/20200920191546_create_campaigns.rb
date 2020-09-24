class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.string :required_instructions, array: true, default: [], null: false
      t.string :optional_instructions, array: true, default: [], null: false
      t.text :full_text
      t.timestamps
    end
  end
end
