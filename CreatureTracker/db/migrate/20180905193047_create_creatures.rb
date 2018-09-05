class CreateCreatures < ActiveRecord::Migration[5.2]
  def change
    create_table :creatures do |t|
      t.string :name
      t.string :species
      t.boolean :status

      t.timestamps
    end
  end
end
