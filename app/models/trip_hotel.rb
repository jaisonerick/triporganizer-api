class TripHotel < ApplicationRecord
  belongs_to :hotel
  belongs_to :trip

  delegate :name, to: :hotel
end
