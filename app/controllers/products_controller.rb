class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      flash[:notice] = "Product details was Added successfully."
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @product.update(product_params)
      flash[:notice] = "Product updated successfully."
      redirect_to @product
    else
      render 'edit'
    end
  end
  
  def destroy
    @product.destroy
    redirect_to products_path
  end
  
  private
    def set_product
      @product = Product.find(params[:id])
    end
    
    def product_params  
      params.require(:product).permit(:product_name,:price,:description, :user_id)
    end
end
