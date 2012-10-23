class CreateGnodes < ActiveRecord::Migration
  def change
    create_table :gnodes do |t|
      t.integer :game_id
      t.string :name
      t.text :markup

      t.timestamps
    end
  end
end
