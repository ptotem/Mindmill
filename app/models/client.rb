class Client < ActiveRecord::Base
  attr_accessible :name, :projects_attributes
  has_many :projects, :dependent => :destroy
  accepts_nested_attributes_for :projects, :reject_if=>proc { |attributes| attributes.all? {|k,v| v.blank?} }
end
