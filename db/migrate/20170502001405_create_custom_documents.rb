class CreateCustomDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_documents do |t|
      t.references :trip, foreign_key: true
      t.string :document
      t.string :name
      t.references :registration, foreign_key: true

      t.timestamps
    end
  end
end
