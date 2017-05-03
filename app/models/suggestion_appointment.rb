class SuggestionAppointment < Appointment
  store_accessor :details,
                 :period, :name

  validates :description, :name, presence: true

  def medium
    'SUGESTÃO'
  end

  def medium_image
    'suggestion.png'
  end
end
