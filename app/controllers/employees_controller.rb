class EmployeesController < ApplicationController
  before_action :find, only: [:create, :show, :edit, :update, :destroy]
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
def find
  @employee = Employee.find(params[:id])
end
