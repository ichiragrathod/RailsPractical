require 'rails_helper'

RSpec.describe ProductsController, type: :request do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    @product = FactoryBot.create(:product)
  end

  it "returns a index" do
    get products_path
    expect(response).to be_successful
  end

  it "returns a new" do
    get new_product_path(@product)
    expect(response).to be_successful
  end

  it "returns a edit" do
    get edit_product_path(@product)
    expect(response).to be_successful
  end

  it "should be update the record" do
    @product.update(price:90560)
    expect(Product.find_by_price(90560)).to eq(@product)
  end

  it "should be create the record" do
    expect do
      post '/products', params: { product: {product_name:"Realme X2", price:22999, description:"Best smartphone", user_id:@user.id }}
    end.to change(Product, :count).by(1)
      expect(response).to have_http_status(:redirect)
  end

  it "should be delete the record" do
    @product.destroy
    expect { @product.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
