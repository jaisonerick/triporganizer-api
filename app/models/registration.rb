class Registration < ApplicationRecord
  mount_uploader :insurance, PdfDocumentUploader

  belongs_to :trip
  belongs_to :user

  has_many :transits, dependent: :destroy

  has_many :hotel_reservations, dependent: :destroy
  has_many :flight_tickets, dependent: :destroy
  has_many :train_tickets, dependent: :destroy

  validates :user, :trip, presence: true
  validates :user, uniqueness: { scope: :trip, message: 'já registrado' }
end
