class Appointment < ApplicationRecord
  belongs_to :trip
  has_many :milestones, dependent: :destroy

  def info
    "Serviço de VAN para o aeroporto saindo da frente da Catedral municipal na praça XV de Novembro"
  end
end
