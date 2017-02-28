class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :phone
      t.integer :company_type

      t.timestamps
    end
  end
end
