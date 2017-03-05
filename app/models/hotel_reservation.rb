class HotelReservation < ApplicationRecord
  belongs_to :registration
  belongs_to :destination

  has_many :events, through: :destination

  validates :registration, :destination, presence: true

  def destination_name
    destination.name
  end

  def hotel_name
    destination.hotel.name
  end

  def hotel_address
    destination.hotel.address
  end

  def starts_at
    destination.starts_at
  end
end
