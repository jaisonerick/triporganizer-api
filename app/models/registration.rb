class Registration < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  has_many :boarding_tickets
end
