class AddCompanyToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :company, foreign_key: true
  end
end
