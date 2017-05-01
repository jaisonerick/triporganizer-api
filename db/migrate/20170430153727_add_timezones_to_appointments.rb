class AddTimezonesToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :origin_time_zone, :string
    add_column :appointments, :destination_time_zone, :string
  end
end
