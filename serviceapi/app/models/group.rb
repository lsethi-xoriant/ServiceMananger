class Group < ActiveRecord::Base

has_and_belongs_to_many :permissions
has_and_belongs_to_many :users
has_and_belongs_to_many :stores

accepts_nested_attributes_for :stores




  validates :name,
            :presence => true,
            :uniqueness => true
  validates :description,
            :presence => true
  validates_associated :stores

  # validates :active,
  #           :presence => true


end
