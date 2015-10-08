class User < ActiveRecord::Base
  has_secure_password
  belongs_to :group
  has_many :permissions,:through => :group

  VALID_EMAIL = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email,
            :presence => true,
            :format => VALID_EMAIL,
            :uniqueness => true

  validates :username,
            :presence => true,
            :uniqueness => true

end
