class CreateInteractionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.text :description #what the description is
      t.integer :goodwill #this interaction affects player reputation xp
      t.integer :bounty #this interaction produces x bounty
      t.integer :npc_id
    end
  end
end
