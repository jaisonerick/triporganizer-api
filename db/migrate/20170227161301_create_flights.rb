class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.references :airline, foreign_key: true
      t.datetime :departure_at
      t.datetime :arrives_at
      t.string :flight_number
      t.string :origin
      t.string :destination
      t.string :boarding_gate
      t.string :phone
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
