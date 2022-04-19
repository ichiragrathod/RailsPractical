class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  
  def index
    @employees = Employee.all
  end
  
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Employee details was Added successfully."
      redirect_to employee_path(@employee)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @employee.update(employee_params)
      flash[:notice] = "Employee updated successfully."
      redirect_to @employee
    else
      render 'edit'
    end
  end
  
  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end
    
    def employee_params  
      params.require(:employee).permit(:employee_name,:email,:password, :gender,:address,:mobile_number,:birth_date,:document,hobbies: [])
    end
end
