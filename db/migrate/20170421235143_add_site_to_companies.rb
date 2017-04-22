class AddSiteToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :site, :string
  end
end
