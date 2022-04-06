class Event < ApplicationRecord
  validates :name, :description, :event_date, presence:true

  has_and_belongs_to_many :users
end
