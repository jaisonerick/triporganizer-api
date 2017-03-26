class HotelAppointment < Appointment
  validates :company, presence: true

  def medium
    'HOTEL'
  end

  def medium_image
    'hotel.png'
  end
end
