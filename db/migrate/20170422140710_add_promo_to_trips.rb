class AddPromoToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :promo, :string
  end
end
