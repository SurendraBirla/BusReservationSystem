class Bus < ApplicationRecord
  belongs_to :bus_owner

  validates_presence_of :name, :registration_no, :source, :destination, :no_of_seats
  
end
