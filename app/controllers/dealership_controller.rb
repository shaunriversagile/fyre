class DealershipController < ApplicationController
  def create
  end

  def update
  end

  def destroy
    @dealership = Dealership.find(params[:id]).delete
  end

  def index
    @dealerships = Dealership.all
  end

  def show
    @dealership = Dealership.find(params[:id])
  end
end
