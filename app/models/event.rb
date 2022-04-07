class Event < ApplicationRecord
  #belongs_to :user
  validates :name, :description, :event_date, presence:true
  has_and_belongs_to_many :users
  belongs_to :category
end
