class Project < ActiveRecord::Base
  attr_accessible :client_id, :name, :project_users_attributes, :active,:summary, :description, :avatar, :backdrop, :games_attributes
  belongs_to :client
  has_many :project_users, :dependent => :destroy
  has_many :games, :dependent => :destroy
  accepts_nested_attributes_for :project_users, :reject_if=>proc { |attributes| attributes.all? {|k,v| v.blank?} }
  accepts_nested_attributes_for :games, :reject_if=>proc { |attributes| attributes.all? {|k,v| v.blank?} }
  has_attached_file :avatar, :styles => {
                          :original => {
                              :geometry => "640x600>"
                          },
                          :thumbnail => {
                              :geometry => "80x80"
                          }
                      }
  has_attached_file :backdrop, :styles => {
      :original => {
          :geometry => "1366x840>"
      }
  }
end
