class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :project_id
      t.integer :game_type_id

      t.timestamps
    end
  end
end
