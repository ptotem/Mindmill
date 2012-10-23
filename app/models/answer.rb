class Answer < ActiveRecord::Base
  attr_accessible :gnode_id, :matter, :user_id
  belongs_to :user
  belongs_to :gnode
end
