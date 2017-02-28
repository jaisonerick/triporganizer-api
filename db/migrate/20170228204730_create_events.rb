class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :destination, foreign_key: true
      t.string :name
      t.string :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :event_type

      t.timestamps
    end
  end
end
