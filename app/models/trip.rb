class Trip < ApplicationRecord
  has_many :destinations
  has_many :flights
  has_many :users, through: :trip_registrations
  has_many :trip_registrations
end
