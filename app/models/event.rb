class Event < ApplicationRecord
  belongs_to :destination
  belongs_to :company, optional: true
  belongs_to :place, optional: true

  enum event_type: [:other, :transport, :visit]

  validates :name, :destination, :starts_at, :ends_at, presence: true
end
