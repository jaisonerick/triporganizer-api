class TripHotel < ApplicationRecord
  belongs_to :hotel
  belongs_to :trip

  def name
    "#{hotel.name} - #{I18n.l(starts_at)} a #{I18n.l(ends_at)}"
  end
end
