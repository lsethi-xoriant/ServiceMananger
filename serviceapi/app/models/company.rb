class Company < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :stores
  has_many :groups,:through => :stores

  before_save :check_image

  VALID_EMAIL = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email,
            :presence => true,
            :format => VALID_EMAIL
            #:uniqueness => true

  validates :name,
            :presence => true,
            :uniqueness => true

  validates :city,
            :presence => true

  validates :country,
            :presence => true



  def check_image
    self.logoImageLink = NO_IMAGE_LINK unless self.logoImageLink
  end
end
