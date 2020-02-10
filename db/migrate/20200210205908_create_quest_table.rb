class CreateQuestTable < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.text :description
      t.integer :reward
      t.integer :goodwill
      t.integer :town_id
    end
  end
end
