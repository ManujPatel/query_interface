class EmployeesController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
    if params[:search]
      if Employee.find_by("email = ?",params[:search])
        flash[:notice]="Email is present"
      else
        flash[:notice]="Email is not present"
      end
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
      if @employee.valid?
        flash[:notice] = "employee is successfully added."
        redirect_to employees_path
      else
        flash[:errors] = @employee.errors.full_messages
        redirect_to new_employee_path
      end
    
  end

  def show
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      flash[:notice] = "Emloyee successfully updated"
      redirect_to employee_path 
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def find
    @employee = Employee.find(params[:id])
  end
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary)
  end

end
