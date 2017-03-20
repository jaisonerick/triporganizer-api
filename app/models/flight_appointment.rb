class FlightAppointment < Appointment
  def self.model_name
    Appointment.model_name
  end

  def medium
    'Voo'
  end

  def medium_image
    'plane.png'
  end
end
