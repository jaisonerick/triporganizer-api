class Trip < ApplicationRecord
  has_many :destinations
  has_many :hotels, through: :destinations
  has_many :registrations
  has_many :users, through: :registrations
  has_many :transports

  scope :visible, -> { where('ends_at >= ?', Time.zone.now) }
  scope :nearest_order, -> { order(starts_at: :asc) }

  validates :name, :starts_at, :ends_at, :image, :description, presence: true
end
