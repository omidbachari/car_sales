class CarsController < ApplicationController
  def index
    @cars = Car.all
  end
  def new
    @car = Car.new
    @manufacturers = Manufacturer.all
  end
  def create
    @car = Car.create(car_params)
    @manufacturers = Manufacturer.all

    if @car.save
      flash[:notice] = 'You successfully added a car!'
      redirect_to cars_path
    else
      flash.now[:notice] = 'Something went wrong.'
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:model_name, :year, :color, :mileage, :manufacturer_id, :description)
  end
end
