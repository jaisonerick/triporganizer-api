class VisitAppointment < Appointment
  validates :description, :company, presence: true

  def medium
    'VISITA'
  end

  def medium_image
    'place.png'
  end
end
