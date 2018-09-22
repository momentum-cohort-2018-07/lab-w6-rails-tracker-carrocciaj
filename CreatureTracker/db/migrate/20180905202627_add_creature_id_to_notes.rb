class AddCreatureIdToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :creature_id, :integer
  end
end
