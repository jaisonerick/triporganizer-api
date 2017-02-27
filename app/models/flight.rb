class Flight < ApplicationRecord
  belongs_to :airline
  belongs_to :trip

  def name
    "#{airline.name_alias} - #{flight_number}"
  end
end
