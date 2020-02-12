class AddNameToInteractionsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :interactions, :action_name, :string
  end
end
