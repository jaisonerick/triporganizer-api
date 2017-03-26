class HotelReservation < ApplicationRecord
  belongs_to :registration
  belongs_to :appointment
end
