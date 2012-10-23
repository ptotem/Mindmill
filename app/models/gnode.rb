class Gnode < ActiveRecord::Base
  attr_accessible :game_id, :markup, :name, :gpaths_attributes,:avatar
  belongs_to :game
  has_many :gpaths, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :completions, :dependent => :destroy
  accepts_nested_attributes_for :gpaths, :reject_if => proc { |attributes| attributes.all? { |k, v| v.blank? } }
  has_attached_file :avatar, :styles => {
                            :original => {
                                :geometry => "640x600>"
                            },
                            :thumbnail => {
                                :geometry => "80x80"
                            }
                        }
end
