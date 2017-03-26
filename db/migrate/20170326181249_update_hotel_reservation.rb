class UpdateHotelReservation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :hotel_reservations, :destinations
    add_reference :hotel_reservations, :appointment, index: true
  end
end
