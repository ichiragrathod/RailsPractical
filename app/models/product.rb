class Product < ApplicationRecord
  validates :product_name, :description, :price, presence:true
end
