class AddDescriptionToGameTypes < ActiveRecord::Migration
  def change
    add_column :game_types, :description, :text
  end
end
