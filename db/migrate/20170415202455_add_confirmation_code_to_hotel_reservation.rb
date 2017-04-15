class AddConfirmationCodeToHotelReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :hotel_reservations, :confirmation_code, :string
  end
end
