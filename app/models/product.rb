class Product < ApplicationRecord
	has_many :orders, dependent: :destroy
	validates :name, :description, :price, presence:true
end
