class HotelReservation < ApplicationRecord
  belongs_to :registration
  belongs_to :trip_hotel
end
