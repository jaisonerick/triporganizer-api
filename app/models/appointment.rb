class Appointment < ApplicationRecord
  belongs_to :trip
  belongs_to :company, optional: true

  has_many :milestones, dependent: :destroy

  validates :type, :scheduled_at, presence: true

  def info
    "Serviço de VAN para o aeroporto saindo da frente da Catedral municipal na praça XV de Novembro"
  end
end
