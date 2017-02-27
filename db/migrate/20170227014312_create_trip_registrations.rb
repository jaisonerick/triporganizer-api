class CreateTripRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_registrations do |t|
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :confirmed

      t.timestamps
    end
  end
end
