#This is not the updated file... next file adds name column to npc table

class CreateNpcTable < ActiveRecord::Migration[5.2]
  def change
    create_table :npcs do |t|
      t.text :description 
      t.integer :town_id
    end
  end
end
