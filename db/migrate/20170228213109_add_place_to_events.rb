class AddPlaceToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :place, foreign_key: true
  end
end
