class BusAppointment < Appointment
  store_accessor :details, :name, :from, :to, :address, :info

  validates :company, :end_date, :from, :to, presence: true

  def medium
    'Ônibus'
  end

  def medium_image
    'bus.png'
  end
end
