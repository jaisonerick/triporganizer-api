class CreateBoardingTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :boarding_tickets do |t|
      t.references :registration, foreign_key: true
      t.references :flight, foreign_key: true
      t.string :flight_class
      t.string :seat
      t.text :qr_code
      t.text :notes

      t.timestamps
    end
  end
end
