class Reservation < ApplicationRecord
  belongs_to :bus
  belongs_to :seat
  belongs_to :customer
end
