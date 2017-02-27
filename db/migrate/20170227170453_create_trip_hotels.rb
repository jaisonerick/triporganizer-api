class CreateTripHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_hotels do |t|
      t.references :hotel, foreign_key: true
      t.references :trip, foreign_key: true
      t.text :notes
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end
  end
end
