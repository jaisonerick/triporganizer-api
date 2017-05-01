class AddDefaultTimeZoneToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :default_time_zone, :string
  end
end
