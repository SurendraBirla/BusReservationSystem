class BusesController < ApplicationController
  before_action :authenticate_bus_owner! ,only:[:new]

  def index

    # @buses = Bus.includes(:bus_owner) 
    # @buses = current_bus_owner.buses

    if current_bus_owner
      @buses = current_bus_owner.buses
    else
      @buses = Bus.all
    end

  end


  def new 

    @bus = Bus.new

  end


  def create 

    @bus = current_bus_owner.buses.new(bus_params)
    if @bus.save
      redirect_to buses_path , notice: "Bus was successfully Created"
    else
      render :new, status: :unprocessable_entity
    end

  end


  private 

  def bus_params

    params.require(:bus).permit(:name, :registration_no, :source, :destination, :no_of_seats)

  end
end
