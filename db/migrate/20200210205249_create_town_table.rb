class CreateTownTable < ActiveRecord::Migration[5.2]
  def change
    create_table :town do |t|
      t.string :name
      t.string :jarl
      t.integer :quest_id
      t.integer :interaction_id
    end
  end
end
