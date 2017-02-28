class Transport < ApplicationRecord
  belongs_to :trip
  belongs_to :company
  store_accessor :specifics, :boarding_gate, :flight_number, :platform

  enum mean: [:plane, :train, :ship, :bus]

  validates :trip, :company, :mean, :departure_at, :arrives_at, :origin, :destination, presence: true

  def name
    case mean
    when "plane"
      "Aéreo - #{flight_number} - #{origin} a #{destination} - #{I18n.l departure_at, :short}"
    when "train"
      "Férreo - #{origin} a #{destination} - #{I18n.l departure_at}"
    when "bus"
      "Rodoviário - #{origin} a #{destination} - #{I18n.l(departure_at, format: :short)}"
    when "ship"
      "Marítimo - #{origin} a #{destination} - #{I18n.l departure_at}"
    else
      "Outro - #{mean}"
    end
  end
end
