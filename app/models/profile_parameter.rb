class ProfileParameter < ActiveRecord::Base
  attr_accessible :name
  has_many :user_profiles, :dependent => :destroy
end
