class DogsController < ApplicationController

  def index
    if params[:view] == "sorted"
      @dogs = Dog.all.sort_by { |dog| dog.employees.count }
    else
      @dogs = Dog.all
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end


end
