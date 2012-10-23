class Gpath < ActiveRecord::Base
  attr_accessible :gnode_id, :markup, :name, :next_id, :avatar
  belongs_to :gnode
  has_many :selections, :dependent => :destroy
  has_attached_file :avatar, :styles => {
                            :original => {
                                :geometry => "640x600>"
                            },
                            :thumbnail => {
                                :geometry => "80x80"
                            }
                        }
end
