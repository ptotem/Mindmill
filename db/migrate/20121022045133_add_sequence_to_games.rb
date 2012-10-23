class AddSequenceToGames < ActiveRecord::Migration
  def change
    add_column :games, :sequence, :integer
  end
end
