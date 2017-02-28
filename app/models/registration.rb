class Registration < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  has_many :hotel_reservations
  has_many :transits

  validates :user, :trip, presence: true
end
