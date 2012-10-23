class GameType < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :games, :dependent => :destroy
end
