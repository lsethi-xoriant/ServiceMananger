class Store < ActiveRecord::Base

  VALID_EMAIL = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email,
            :presence => true,
            :format => VALID_EMAIL,
            :uniqueness => true

  validates :name,
            :presence => true,
            :uniqueness => true

  validates :city,
            :presence => true

  validates :country,
            :presence => true

end
