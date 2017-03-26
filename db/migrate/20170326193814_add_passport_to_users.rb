class AddPassportToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :passport, :string
  end
end
