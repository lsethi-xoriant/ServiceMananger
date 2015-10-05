class Group < ActiveRecord::Base

  has_many :users


  validates :name,
            :presence => true
  validates :description,
            :presence => true
  # validates :active,
  #           :presence => true


end
