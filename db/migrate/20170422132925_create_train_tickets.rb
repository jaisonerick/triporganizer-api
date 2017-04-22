class CreateTrainTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :train_tickets do |t|
      t.references :appointment, foreign_key: true
      t.references :registration, foreign_key: true
      t.text :details
      t.string :ticket
    end
  end
end
