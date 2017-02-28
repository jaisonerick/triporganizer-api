class Transport < ApplicationRecord
  belongs_to :trip
  belongs_to :company
  store_accessor :specifics, :boarding_gate, :flight_number, :platform

  enum mean: [:plane, :train, :ship, :bus]
end
