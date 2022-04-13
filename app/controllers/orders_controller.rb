class OrdersController < ApplicationController
  before_action :set_product
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
 		@orders = @product.orders
  end

  def new
    @order = @product.orders.build
  end

  def create
    @order = @product.orders.build(order_params)

    if @order.save
      flash[:notice] = "Order details was Added successfully."
      redirect_to [@product, @order]
    else
        render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @order.update(order_params)
      flash[:notice] = "Order updated successfully."
      redirect_to [@product, @order]
    else
      render 'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to [@product, :orders]
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_order
      @order = @product.orders.find(params[:id])
    end

    def order_params  
      params.require(:order).permit(:quantity, :total_price)
    end
end
