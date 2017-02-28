class HotelReservation < ApplicationRecord
  belongs_to :registration
  belongs_to :destination

  validates :registration, :destination, :starts_at, :ends_at, presence: true
end
