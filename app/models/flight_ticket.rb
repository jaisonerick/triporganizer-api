class FlightTicket < ApplicationRecord
  belongs_to :registration
  belongs_to :appointment
end
