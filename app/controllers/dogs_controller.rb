class DogsController < ApplicationController

  def index
    IF(params[button])
    @dogs = Dog.all
  else

  end

  def show
    @dog = Dog.find(params[:id])
  end


end
