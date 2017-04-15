class AddConfirmationNumberToFlightTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :flight_tickets, :confirmation_number, :string
  end
end
