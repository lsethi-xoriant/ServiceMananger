class Store < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :users
  belongs_to :company

  accepts_nested_attributes_for :company

  after_create :create_default_user_group
  before_save :check_image


  VALID_EMAIL = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email,
            :presence => true,
            :format => VALID_EMAIL,
            :uniqueness => true

  validates :name,
            :presence => true

  validates :city,
            :presence => true

  validates :country,
            :presence => true

  validates :company_id,
            :presence => true


  def create_default_user_group
    self.groups.create(:name => "#{self.name} Employee",:description=> "Default Employee Group for #{self.name}")
  end

  def check_image
    self.logoImageLink = NO_IMAGE_LINK unless self.logoImageLink
  end

end
