class CreatePlayerTable < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.integer :money
    end
  end
end
