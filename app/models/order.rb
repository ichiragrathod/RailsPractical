class Order < ApplicationRecord
  belongs_to :product
	validates :quantity, presence:true

	private
	before_create :calculate_total_price
	def calculate_total_price
		product_price = Product.where('id = ?', product_id).pluck(:price)[0]
		self.total_price = product_price * quantity
	end
end
