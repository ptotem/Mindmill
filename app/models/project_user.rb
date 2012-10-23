class ProjectUser < ActiveRecord::Base
  attr_accessible :project_id, :role, :user_id
  belongs_to :project
  belongs_to :user
end
