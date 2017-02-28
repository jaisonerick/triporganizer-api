class DropTripHotels < ActiveRecord::Migration[5.0]
  def change
    remove_reference :hotel_reservations, :trip_hotel, foreign_key: true
    drop_table :trip_hotels
    add_reference :hotel_reservations, :destination, foreign_key: true
  end
end
