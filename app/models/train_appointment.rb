class TrainAppointment < Appointment
  store_accessor :details, :line, :from, :to, :address, :info

  validates :company, :end_date, :from, :to, presence: true

  def medium
    'Trem'
  end

  def medium_image
    'train.png'
  end
end
