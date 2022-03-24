class EmployeesController < ApplicationController
    
    before_action :set_employee, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all 
        if params[:search]
            if Employee.find_by("email = ?", params[:search])
                flash[:notice] = "Email is exist"
            else
                flash[:notice] = "Email is not exist"
            end
        end
    end

    def show
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            flash[:notice] = "Employee details was created successfully."
            redirect_to employee_path(@employee)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @employee.update_with_conflict_validation(employee_params)
            flash[:notice] = "Employee details updated successfully."
            redirect_to @employee
        else
            render 'edit'
        end
    end

    def destroy
        @employee.destroy
        redirect_to employees_path
    end

    def employee_querys
    end

    def increase_order
        Employee.find_in_batches(batch_size:10) do |employee|
            employee.each do |e|
                e.no_of_order+=1
                e.save
            end
        end
        redirect_to employees_path
    end

    def decrease_order
        Employee.find_in_batches(batch_size:10) do |employee|
            employee.each do |e|
                e.no_of_order-=1
                e.save
            end
        end
        redirect_to employees_path
    end

    private
    def set_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary, :lock_version)
    end
end
