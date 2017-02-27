class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :description
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end
  end
end
