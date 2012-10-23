class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:admin, :user_profiles_attributes, :name
  has_many :project_users,:dependent => :destroy
  has_many :projects,:through => :project_users
  has_many :user_profiles,:dependent => :destroy
  has_many :selections,:dependent => :destroy
  has_many :completions,:dependent => :destroy
  has_many :answers,:dependent => :destroy
  has_many :scores,:dependent => :destroy
  accepts_nested_attributes_for :user_profiles, :reject_if=>proc { |attributes| attributes.all? {|k,v| v.blank?} }


end
