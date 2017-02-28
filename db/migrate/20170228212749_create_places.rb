class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.string :google_places_id
      t.decimal :latitude
      t.decimal :longitude
      t.string :picture_url
      t.string :address

      t.timestamps
    end
  end
end
