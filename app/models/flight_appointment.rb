class FlightAppointment < Appointment
  store_accessor :details, :gate, :flight_number

  validates :company, :end_date, :flight_number, presence: true

  def medium
    'Voo'
  end

  def medium_image
    'plane.png'
  end
end
