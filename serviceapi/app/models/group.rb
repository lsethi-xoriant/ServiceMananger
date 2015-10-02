class Group < ActiveRecord::Base

  validates :name,
            :presence => true
  validates :description,
            :presence => true
  # validates :active,
  #           :presence => true


end
