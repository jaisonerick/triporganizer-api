class Trip < ApplicationRecord
  has_many :destinations
  has_many :flights
  has_many :users, through: :registrations
  has_many :registrations
  has_many :hotels, through: :trip_hotels
  has_many :trip_hotels
end
