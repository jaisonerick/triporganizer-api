class RenameRegistrationTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :trip_registrations, :registrations
  end
end
