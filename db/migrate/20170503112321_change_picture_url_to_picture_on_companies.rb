class ChangePictureUrlToPictureOnCompanies < ActiveRecord::Migration[5.0]
  def change
    rename_column :companies, :picture_url, :picture
  end
end
