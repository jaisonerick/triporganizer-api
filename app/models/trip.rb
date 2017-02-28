class Trip < ApplicationRecord
  has_many :destinations
  has_many :hotels, through: :destinations
  has_many :registrations
  has_many :users, through: :registrations
  has_many :transports

  validates :name, presence: true

end
