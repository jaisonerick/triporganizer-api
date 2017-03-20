class CreateMilestones < ActiveRecord::Migration[5.0]
  def change
    create_table :milestones do |t|
      t.references :appointment, foreign_key: true
      t.string :description
      t.integer :order

      t.timestamps
    end
  end
end
