class Selection < ActiveRecord::Base
  attr_accessible :gpath_id, :user_id
  belongs_to :gpath
  belongs_to :user
end
