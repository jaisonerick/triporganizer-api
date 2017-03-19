class AddImageToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :image, :string
  end
end
