class FlightAppointment < Appointment
  store_accessor :details,
                 :arrival_gate, :arrival_platform,
                 :departure_gate, :departure_platform,
                 :flight_number, :from, :to

  validates :company, :from, :to, :end_date, :flight_number, presence: true

  def medium
    'Voo'
  end

  def medium_image
    'plane.png'
  end
end
