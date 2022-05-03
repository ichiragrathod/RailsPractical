require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation test' do
    it 'ensures product name presence' do
      product = Product.new(price:25000, description:"dfsadf").save
      expect(product).to eq(false) 
    end

    it 'ensures product price presence' do
      product = Product.new(product_name:"Galaxy M30", description:"Best Monster Mobile").save
      expect(product).to eq(false) 
    end

    it 'ensures product description presence' do
      product = Product.new(product_name:"Galaxy M30", price:25000).save
      expect(product).to eq(false) 
    end

    it 'should save successfully' do
      product = Product.new(product_name:"fasdsadfa", price:25000, description:"dfsadf", user_id:1).save
      expect(product).to eq(true) 
    end
  end
end
