class Bus < ApplicationRecord
  belongs_to :bus_owner
  has_many :seats ,  dependent: :destroy
  has_many :reservations

  validates_presence_of :name, :registration_no, :source, :destination, :no_of_seats


  def available_seats
    seats.reject { |seat| seat_booked?(seat) }
  end

  def booked_seats
    seats.select { |seat| seat_booked?(seat) }
  end

  private

  def seat_booked?(seat)
    reservations.exists?(seat_id: seat.id)
  end
  
end
