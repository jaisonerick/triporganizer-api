class HotelReservation < ApplicationRecord
  belongs_to :registration
  belongs_to :destination
end
