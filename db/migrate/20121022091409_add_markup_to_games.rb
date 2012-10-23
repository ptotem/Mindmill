class AddMarkupToGames < ActiveRecord::Migration
  def change
    add_column :games, :markup, :text
  end
end
