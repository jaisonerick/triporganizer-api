class Trip < ApplicationRecord
  has_many :destinations
  has_many :flights
  has_many :users, through: :registrations
  has_many :registrations
end
