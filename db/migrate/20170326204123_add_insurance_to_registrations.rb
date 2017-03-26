class AddInsuranceToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :insurance, :string
  end
end
