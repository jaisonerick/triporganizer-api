class CreateHotelReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :hotel_reservations do |t|
      t.references :registration, foreign_key: true
      t.references :trip_hotel, foreign_key: true
      t.string :room
      t.text :notes

      t.timestamps
    end
  end
end
