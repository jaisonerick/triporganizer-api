class HotelReservation < ApplicationRecord
  belongs_to :registration
  belongs_to :destination

  validates :registration, :destination, presence: true
end
