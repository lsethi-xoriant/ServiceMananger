class User < ActiveRecord::Base
  has_secure_password

 has_and_belongs_to_many :groups
  has_and_belongs_to_many :companies
  has_many :permissions,:through => :groups

  VALID_EMAIL = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email,
            :presence => true,
            :format => VALID_EMAIL,
            :uniqueness => true

  validates :username,
            :presence => true,
            :uniqueness => true





  def permissions?(user_permissions)
    permissions.pluck(:name).include?  user_permissions.to_s
  end





end
