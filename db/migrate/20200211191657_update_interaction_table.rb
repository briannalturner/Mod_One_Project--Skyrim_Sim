class UpdateInteractionTable < ActiveRecord::Migration[5.2]
  def change
    add_column :interactions, :town_id, :integer
  end
end
