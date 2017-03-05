class Destination < ApplicationRecord
  belongs_to :trip
  belongs_to :hotel
  has_many :hotel_reservations, dependent: :destroy
  accepts_nested_attributes_for :hotel_reservations

  has_many :events

  validates :name, :starts_at, :ends_at, :hotel, :trip, presence: true
end
