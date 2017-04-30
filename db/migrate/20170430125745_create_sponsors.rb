class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :image
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
