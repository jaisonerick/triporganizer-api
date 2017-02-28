class Event < ApplicationRecord
  belongs_to :destination
  belongs_to :company, optional: true
  belongs_to :place, optional: true

  enum event_type: [:other, :transport, :visit, :tour]

  validates :name, :destination, :starts_at, :ends_at, presence: true

  def label
    case event_type
    when "other"
      "Outro"
    when "transport"
      "Transporte"
    when "visit"
      "Visita Técnica"
    when "tour"
      "Passeio"
    end
  end
end
