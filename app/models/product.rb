class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :product_name, :description, :price, presence:true
end
