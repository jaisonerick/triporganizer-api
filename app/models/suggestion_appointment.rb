class SuggestionAppointment < Appointment
  store_accessor :details,
                 :period, :name, :long_description

  validates :description, :name, :company, presence: true

  def medium
    'LIVRE'
  end

  def medium_image
    'suggestion.png'
  end
end
