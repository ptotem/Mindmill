class Score < ActiveRecord::Base
  attr_accessible :game_id, :user_id, :value
  belongs_to :user
  belongs_to :game
end
