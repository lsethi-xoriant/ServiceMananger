class Store < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :users
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

end
