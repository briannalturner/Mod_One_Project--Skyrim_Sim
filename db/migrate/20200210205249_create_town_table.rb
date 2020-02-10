class CreateTownTable < ActiveRecord::Migration[5.2]
  def change
    create_table :town do |t|
      t.string :name
      t.string :jarl
    end
  end
end
