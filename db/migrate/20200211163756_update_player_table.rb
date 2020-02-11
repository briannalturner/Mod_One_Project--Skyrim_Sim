class UpdatePlayerTable < ActiveRecord::Migration[5.2]
  #location integer represents town_id
  def change
    add_column :players, :location, :integer 
  end
end
