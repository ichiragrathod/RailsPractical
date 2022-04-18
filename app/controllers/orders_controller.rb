class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :edit, :update, :destroy]
	before_action :require_admin, except:[:index]

	def index
		@orders = Order.all
	end

	def new
		@order = Order.new
	end

    def create
		@order = Order.new(order_params)
		if @order.save
			flash[:notice] = "Order details was Added successfully."
			redirect_to order_path(@order)
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
			redirect_to @order
		else
			render 'edit'
		end
	end

	def destroy
		@order.destroy
		redirect_to orders_path
	end

	private
	def set_order
		@order = Order.find(params[:id])
	end

	def order_params  
		params.require(:order).permit(:quantity,:product_id)
	end
end
