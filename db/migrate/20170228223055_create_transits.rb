class CreateTransits < ActiveRecord::Migration[5.0]
  def change
    create_table :transits do |t|
      t.references :registration, foreign_key: true
      t.references :transport, foreign_key: true
      t.jsonb :specifics
      t.string :attachment_url

      t.timestamps
    end
  end
end
