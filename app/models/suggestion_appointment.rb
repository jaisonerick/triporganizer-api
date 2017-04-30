class SuggestionAppointment < Appointment
  store_accessor :details,
                 :period, :name

  validates :company, :period, :description, :name, presence: true

  before_validation :fix_scheduled_at

  def fix_scheduled_at
    unless scheduled_at.respond_to?(:change) && period.present?
      self.scheduled_at = scheduled_at
      return
    end

    self.scheduled_at = case period
                        when 'morning'
                          scheduled_at.change(hour: 12, min: 0, sec: 0)
                        when 'afternoon'
                          scheduled_at.change(hour: 18, min: 0, sec: 0)
                        when 'night'
                          scheduled_at.change(hour: 23, min: 59, sec: 59)
                        else
                          scheduled_at
                        end
  end

  def medium
    case period
    when 'morning'
      'MANHÃ LIVRE'
    when 'afternoon'
      'TARDE LIVRE'
    when 'night'
      'NOITE LIVRE'
    else
      'LIVRE'
    end
  end

  def medium_image
    'suggestion.png'
  end

  def formatted_time
    nil
  end
end
