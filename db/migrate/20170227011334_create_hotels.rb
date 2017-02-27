class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.decimal :latitude
      t.decimal :longitude
      t.string :phone
      t.string :email
      t.string :google_places_id

      t.timestamps
    end
  end
end
