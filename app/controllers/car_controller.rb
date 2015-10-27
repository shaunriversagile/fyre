class CarController < ApplicationController
  def create
  end

  def update
  end

  def destroy
    @car = Car.find(params[:id]).delete
  end

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end
end
