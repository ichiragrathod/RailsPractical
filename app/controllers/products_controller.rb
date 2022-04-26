class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except:[:index]
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
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
      params.require(:product).permit(:product_name,:description,:price)
    end
end
