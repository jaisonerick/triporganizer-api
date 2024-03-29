class CreateAirlines < ActiveRecord::Migration[5.0]
  def change
    create_table :airlines do |t|
      t.integer :openflight_id
      t.string :name
      t.string :name_alias
      t.string :iata
      t.string :icao
      t.string :callsign
      t.string :country
      t.boolean :active

      t.timestamps
    end
  end
end
