class CreateRelationshipTable < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :bounty
      t.boolean :thanehood
      t.integer :goodwill
      t.boolean :home
    end
  end
end
