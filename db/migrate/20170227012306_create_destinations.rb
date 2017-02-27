class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :google_places_id
      t.string :picture_url
      t.integer :order
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
