class TripRegistration < ApplicationRecord
  belongs_to :trip
  belongs_to :user
end
