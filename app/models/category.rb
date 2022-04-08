class Category < ApplicationRecord
  has_many :events
  validates :category_name, presence: true, uniqueness: true
end
