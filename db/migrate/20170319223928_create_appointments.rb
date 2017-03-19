class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :trip, foreign_key: true
      t.string :type
      t.text :description
      t.datetime :scheduled_at
      t.jsonb :details

      t.timestamps
    end
  end
end
