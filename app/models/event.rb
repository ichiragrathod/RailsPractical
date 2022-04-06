class Event < ApplicationRecord
  validates :name, :description, :event_date, presence:true
end
