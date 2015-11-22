class User < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :stores
  has_many :permissions,:through => :groups
  belongs_to :account_package

  accepts_nested_attributes_for :companies
  accepts_nested_attributes_for :groups
  accepts_nested_attributes_for :stores

  VALID_EMAIL = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email,
            :presence => true,
            :format => VALID_EMAIL,
            :uniqueness => true

  validates :username,
            :presence => true
            # :presence => true,
            # :uniqueness => true
  validates :company_ids,
            :presence => {message: "Company is not present"}




  def permissions?(user_permissions)
    permissions.pluck(:name).include?  user_permissions.to_s
  end


end
