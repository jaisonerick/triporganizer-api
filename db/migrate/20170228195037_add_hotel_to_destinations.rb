class AddHotelToDestinations < ActiveRecord::Migration[5.0]
  def change
    add_reference :destinations, :hotel, foreign_key: true
  end
end
