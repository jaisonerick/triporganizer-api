class Trip < ApplicationRecord
  mount_uploader :promo, PdfDocumentUploader

  has_many :destinations
  has_many :hotels, through: :destinations
  has_many :registrations
  has_many :users, through: :registrations
  has_many :transports
  has_many :appointments
  has_many :flight_appointments
  has_many :train_appointments
  has_many :hotel_appointments
  has_many :sponsors

  scope :visible, -> { where('ends_at >= ?', Time.zone.now) }
  scope :upcoming, -> { where('starts_at >= ?', Time.zone.now) }

  scope :nearest_order, -> { order(starts_at: :asc) }

  validates :name, :starts_at, :ends_at, :default_time_zone, :image, :description, presence: true

  attr_accessor :place

  def documents(current_user)
    @documents ||= Document.get_all(self, current_user)
  end
end
