class TrainAppointment < Appointment
  store_accessor :details, :platform, :train_number

  validates :company, :end_date, :train_number, :platform, presence: true

  def medium
    'Trem'
  end

  def medium_image
    'train.png'
  end
end
