class RemoveAddressFromDestinations < ActiveRecord::Migration[5.0]
  def change
    remove_column :destinations, :address, :string
    remove_column :destinations, :description, :string
  end
end
