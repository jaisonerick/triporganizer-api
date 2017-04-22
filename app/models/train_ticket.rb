class TrainTicket < ApplicationRecord
  belongs_to :registration
  belongs_to :appointment

  def info
    [details.presence, appointment.description.presence].compact.join("\n");
  end
end
