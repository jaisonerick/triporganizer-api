class CreateTransports < ActiveRecord::Migration[5.0]
  def change
    create_table :transports do |t|
      t.references :trip, foreign_key: true
      t.references :company, foreign_key: true
      t.datetime :departure_at
      t.datetime :arrives_at
      t.string :origin
      t.string :destination
      t.string :attachment_url
      t.integer :mean
      t.jsonb :specifics

      t.timestamps
    end
  end
end
