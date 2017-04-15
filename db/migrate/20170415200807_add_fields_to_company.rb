class AddFieldsToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :latitude, :decimal
    add_column :companies, :longitude, :decimal
    add_column :companies, :google_places_id, :string
    add_column :companies, :picture_url, :string
  end
end
