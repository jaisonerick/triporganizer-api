class BoardingTicket < ApplicationRecord
  belongs_to :registration
  belongs_to :flight
end
