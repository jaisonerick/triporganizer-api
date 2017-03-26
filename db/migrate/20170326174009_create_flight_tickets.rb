class CreateFlightTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :flight_tickets do |t|
      t.references :appointment, foreign_key: true
      t.string :seat
      t.text :details

      t.timestamps
    end
  end
end
