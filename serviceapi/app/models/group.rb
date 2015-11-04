class Group < ActiveRecord::Base
has_and_belongs_to_many :permissions
has_and_belongs_to_many :users
has_and_belongs_to_many :stores


  validates :name,
            :presence => true
  validates :description,
            :presence => true
  # validates :active,
  #           :presence => true


end
