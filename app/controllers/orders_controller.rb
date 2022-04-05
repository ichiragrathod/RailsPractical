class OrdersController < ApplicationController
    
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    def index
        #Searching Orders Record by Status
        if params[:search]
            @orders = Order.all
            @orders = Order.where(status:'booked') if params[:search] == 'booked'
            @orders = Order.where(status:'cancelled') if params[:search] == 'cancelled'
        else
            @orders = Order.all
        end
        
        #Searching Orders Record by Product name
        begin
            if !(params[:product_name].blank?)
                @orders_by_product = Product.where(["title LIKE ?","%#{params[:product_name]}%"])[0].orders
            end    
        rescue Exception
            flash[:notice] = "Record not found!"
            redirect_to orders_path
        end
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
        params.require(:order).permit(:quantity,:product_id,:status,:customer_id)
    end
end
