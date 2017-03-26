class UpdateHotelReservation < ActiveRecord::Migration[5.0]
  def change
    add_reference :hotel_reservations, :appointment, index: true
  end
end
