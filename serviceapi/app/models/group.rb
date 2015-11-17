class Group < ActiveRecord::Base

has_and_belongs_to_many :permissions
has_and_belongs_to_many :users
has_and_belongs_to_many :stores

accepts_nested_attributes_for :stores
accepts_nested_attributes_for :permissions




  validates :name,
            :presence => true
  validates :description,
            :presence => true
  validates :store_ids,
            :presence => true

  # validates :active,
  #           :presence => true


end
