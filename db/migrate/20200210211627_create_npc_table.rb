class CreateNpcTable < ActiveRecord::Migration[5.2]
  def change
    create_table :npcs do |t|
      t.text :description #a female guard
      t.integer :town_id
    end
  end
end
