class UserProfile < ActiveRecord::Base
  attr_accessible :profile_parameter_id, :user_id, :value
  belongs_to :user
  belongs_to :profile_parameter
end
