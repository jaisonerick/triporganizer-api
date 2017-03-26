class AddRegistrationToFlightTickets < ActiveRecord::Migration[5.0]
  def change
    add_reference :flight_tickets, :registration, foreign_key: true
  end
end
