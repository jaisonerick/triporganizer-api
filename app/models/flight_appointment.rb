class FlightAppointment < Appointment
  store_accessor :details,
                 :arrival_gate, :arrival_platform,
                 :departure_gate, :departure_platform,
                 :flight_number, :from, :to

  validates :company, :from, :to, :end_date, :flight_number, :origin_time_zone, :destination_time_zone, presence: true

  before_validation :fix_time_zone

  def fix_time_zone
    if scheduled_at? && origin_time_zone?
      self.scheduled_at = ActiveSupport::TimeZone.new(origin_time_zone).local_to_utc(scheduled_at)
    end

    if end_date? && destination_time_zone?
      self.end_date = ActiveSupport::TimeZone.new(destination_time_zone).local_to_utc(end_date)
    end
  end

  def end_date_local_time
    end_date.in_time_zone(destination_time_zone)
  end

  def time_zone
    origin_time_zone
  end

  def medium
    'Voo'
  end

  def medium_image
    'plane.png'
  end
end
