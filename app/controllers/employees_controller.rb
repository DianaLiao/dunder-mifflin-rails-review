class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    emp_params

    @employee = Employee.create(first_name: emp_params[:first_name], last_name: emp_params[:last_name], alias: emp_params[:alias], office: emp_params[:office], dog_id: emp_params[:dog_id].to_i, title: emp_params[:title])

    redirect_to employee_path(@employee.id)
  end

  private

  def emp_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :office, :dog_id, :title )
  end


end
