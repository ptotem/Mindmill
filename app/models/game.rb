class Game < ActiveRecord::Base
  attr_accessible :game_type_id, :project_id, :gnodes_attributes, :avatar, :marquee, :sequence, :markup
  belongs_to :game_type
  belongs_to :project
  has_many :gnodes, :dependent => :destroy
  has_many :scores, :dependent => :destroy
  accepts_nested_attributes_for :gnodes, :reject_if => proc { |attributes| attributes.all? { |k, v| v.blank? } }
  has_attached_file :avatar, :styles => {
      :original => {
          :geometry => "1366x840>"
      },
      :thumbnail => {
          :geometry => "80x80"
      }
  }
  has_attached_file :marquee, :styles => {
      :original => {
          :geometry => "1366x840>"
      },
      :thumbnail => {
          :geometry => "80x80"
      }
  }

  after_create :create_scores

  def create_scores
    self.project.project_users.each do |project_user|
      Score.create!(:game_id=>self.id,:user_id=>project_user.user.id,:value=>0)
    end
  end

end
