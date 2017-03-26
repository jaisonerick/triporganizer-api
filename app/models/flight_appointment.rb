class FlightAppointment < Appointment
  store_accessor :details, :gate, :flight_number, :from, :to

  validates :company, :from, :to, :end_date, :flight_number, presence: true

  def medium
    'Voo'
  end

  def medium_image
    'plane.png'
  end
end
