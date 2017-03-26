class Appointment < ApplicationRecord
  belongs_to :trip
  belongs_to :company, optional: true

  has_many :milestones, dependent: :destroy

  has_many :flight_tickets, dependent: :destroy
  accepts_nested_attributes_for :flight_tickets

  has_many :hotel_reservations, dependent: :destroy
  accepts_nested_attributes_for :hotel_reservations

  validates :type, :scheduled_at, presence: true

  def info
    "Serviço de VAN para o aeroporto saindo da frente da Catedral municipal na praça XV de Novembro"
  end
end
