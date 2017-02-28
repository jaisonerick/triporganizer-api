class Destination < ApplicationRecord
  belongs_to :trip
  belongs_to :hotel
  has_many :hotel_reservations

  validates :name, :starts_at, :ends_at, :hotel, :trip, presence: true
end
