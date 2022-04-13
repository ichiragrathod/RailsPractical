class Business::CustomersController < ApplicationController

	before_action :set_customer, only: [:preview, :edit, :update, :delete_customer]

  def index
    @customers = Customer.all 
  end

  def preview
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "Customer details was created successfully."
      redirect_to preview_business_customer_path(@customer)
    else
      render new_business_customers_path
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = "Customer details updated successfully."
      redirect_to preview_business_customer_path(@customer)
    else
        render edit_business_customers_path
    end
  end

  def delete_customer
    @customer.destroy
    redirect_to business_customers_path
  end

	def search
    @customers = Customer.where('name LIKE ?', params[:search_name] + "%")
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :phone_number)
  end  
end
