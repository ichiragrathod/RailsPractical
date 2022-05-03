require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "Product name must be exist" do
    assert_not Product.new(price: 95500, description:"Best and High Quality Camera Devise.", user_id:1).save
  end

  test "User must be exist" do
    assert_not Product.new(product_name:"Galaxy S21 Ultra 5G", price: 95500, description:"Best and High Quality Camera Devise.").save
  end

  test "Product price must be exist" do
    assert_not Product.new(product_name:"Galaxy S21 Ultra 5G", description:"Best and High Quality Camera Devise.", user_id:1).save
  end

  test "Product description must be exist" do
    assert_not Product.new(product_name:"Galaxy S21 Ultra 5G", price: 95500, user_id:1).save
  end

  test "Product should save" do
    assert Product.new(product_name:"Galaxy S21 Ultra 5G", price: 95500, description:"Best and High Quality Camera Devise.", user_id:1).save
  end
end
