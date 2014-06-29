class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    @manufacturer.save

    if @manufacturer.save
      flash[:notice] = 'You have successfully added a manufacturer!'
      redirect_to manufacturers_path
    else
      flash.now[:notice] = 'Something went wrong.'
      render :new
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
