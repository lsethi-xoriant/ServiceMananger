class Group < ActiveRecord::Base
  @@validation_trigger = false

  attr_accessor :validation_trigger


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
            :presence =>  {message: "Store is not present"},:if => :should_validate

  # validates :active,
  #           :presence => true


  def should_validate
    validation_trigger
  end


end
