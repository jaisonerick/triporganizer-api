class AddEndDateToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :end_date, :datetime
  end
end
