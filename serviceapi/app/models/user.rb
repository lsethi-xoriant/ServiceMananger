class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :validation_trigger

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :stores
  has_many :permissions,:through => :groups
  belongs_to :account_package

  accepts_nested_attributes_for :companies
  accepts_nested_attributes_for :groups
  accepts_nested_attributes_for :stores

  after_initialize :add_language



  VALID_EMAIL = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email,
            :presence => true,
            :format => VALID_EMAIL,
            :uniqueness => true

  validates :first_name,
            :presence => true
  validates :company_ids,
            :presence => true ,:if=> :should_validate?
  validates :account_package_id,
            :presence => true,:unless => :should_validate?



  def should_validate?
    validation_trigger
  end

  def permissions?(user_permissions)
    permissions.pluck(:name).include?  user_permissions.to_s
  end

  def add_language
    self.language = "en" unless self.language
  end

end
