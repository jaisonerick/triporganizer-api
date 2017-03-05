class Destination < ApplicationRecord
  belongs_to :trip
  belongs_to :hotel
  has_many :hotel_reservations, dependent: :destroy
  has_many :events

  validates :name, :starts_at, :ends_at, :hotel, :trip, presence: true
end
