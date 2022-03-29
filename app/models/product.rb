class Product < ApplicationRecord
    enum status: [:In_stock, :out_of_stock, :Coming_soon]
    default_scope { where(:is_active => true) }
    validates :title, :description, :price, :capacity, :status, presence:true
end
