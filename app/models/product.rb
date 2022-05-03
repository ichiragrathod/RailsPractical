class Product < ApplicationRecord
  belongs_to :user
  validates :product_name, :price, :description, presence: true 
end
