class Transport < ApplicationRecord
  belongs_to :trip
  belongs_to :company
  store_accessor :specifics, :boarding_gate, :flight_number, :platform

  has_many :transits

  enum mean: [:plane, :train, :ship, :bus]

  validates :trip, :company, :mean, :departure_at, :arrives_at, :origin, :destination, presence: true

  def transit(registration)
    transits.find_by(registration: registration)
  end

  def name
    case mean
    when "plane"
      "#{mean_label} - #{flight_number} - #{origin} a #{destination} - #{I18n.l departure_at, format: :short}"
    else
      "#{mean_label} - #{origin} a #{destination} - #{I18n.l departure_at}"
    end
  end

  def mean_label
    case mean
    when "plane"
      "Aéreo"
    when "train"
      "Férreo"
    when "bus"
      "Rodoviário"
    when "ship"
      "Marítimo"
    end
  end

  def details
    case mean
    when "plane"
      return { 'Portão de Embarque' => boarding_gate, 'Número do Voo' => flight_number }
    when "train"
      return { 'Plataforma' => platform }
    when "bus"
      return { 'Portão de Embarque' => boarding_gate }
    else
      {}
    end
  end
end
