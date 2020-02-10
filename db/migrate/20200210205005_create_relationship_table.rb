class CreateRelationshipTable < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :player_id 
      t.integer :town_id
      t.integer :bounty
      t.boolean :thanehood
      t.integer :goodwill
      t.boolean :home
    end
  end
end
