class DropAirlineTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :boarding_tickets
    drop_table :flights
    drop_table :airlines
  end
end
