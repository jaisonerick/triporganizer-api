class VisitAppointment < Appointment
  store_accessor :details,
                 :long_description

  validates :description, :company, presence: true

  def medium
    'VISITA'
  end

  def medium_image
    'place.png'
  end
end
