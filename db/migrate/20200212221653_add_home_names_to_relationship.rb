class AddHomeNamesToRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :home_name, :string
  end
end
