class HotelAppointment < Appointment
  validates :company, :end_date, presence: true

  def medium
    'HOTEL'
  end

  def medium_image
    'hotel.png'
  end
end
