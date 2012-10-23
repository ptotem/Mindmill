class Completion < ActiveRecord::Base
  attr_accessible :gnode_id, :user_id, :attempts
  belongs_to :gnode
  belongs_to :user
end
