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
    @employee = Employee.create(emp_params)
    #@employee = Employee.create(first_name: emp_params[:first_name], last_name: emp_params[:last_name], alias: emp_params[:alias], office: emp_params[:office], dog_id: emp_params[:dog_id].to_i, title: emp_params[:title])

    redirect_to employee_path(@employee.id)
  end

  def edit
    find_employee
  end

  def update
    find_employee
    @employee.update(emp_params)

    redirect_to employee_path(@employee.id)
  end

  private

  def emp_params
    params[:employee][:dog_id] = params[:employee][:dog_id].to_i
    
    params.require(:employee).permit(:first_name, :last_name, :alias, :office, :dog_id, :title )
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

end
