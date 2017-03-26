class TrainAppointment < Appointment
  store_accessor :details, :line, :from, :to, :address

  validates :company, :end_date, :line, :from, :to, :address, presence: true

  def medium
    'Trem'
  end

  def medium_image
    'train.png'
  end
end
