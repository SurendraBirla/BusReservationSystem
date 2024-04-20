class BusesController < ApplicationController
  before_action :authenticate_bus_owner! ,only:[:new]
  # before_action :set_bus, only: [:show]

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
      create_seats_for_bus(@bus)
      redirect_to buses_path , notice: "Bus was successfully Created"
    else
      render :new, status: :unprocessable_entity
    end

  end


  def search
     @buses = Bus.where("name LIKE ? AND source LIKE ? AND destination LIKE ?", "%#{params[:name]}%", "%#{params[:source]}%", "%#{params[:destination]}%")
  end
  

  

  def show
    @bus = Bus.find(params[:id])
    @available_seats = @bus.available_seats
    @booked_seats = @bus.booked_seats
  end

  private

  # def set_bus
  #   @bus = Bus.find(params[:id])
  # end

  def create_seats_for_bus(bus)
    bus.no_of_seats.times do |s|
      bus.seats.create(seat_number: s+1)
    end
  end

  def bus_params

    params.require(:bus).permit(:name, :registration_no, :source, :destination, :no_of_seats)

  end
end
