class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :picture_url, :string
    add_column :users, :cpf, :string
    add_column :users, :birthday, :date
    add_column :users, :address, :text
    add_column :users, :phone, :string
  end
end
