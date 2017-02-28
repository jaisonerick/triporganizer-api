class ChangeEventTypeToEnum < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :event_type
    add_column :events, :event_type, :integer
  end
end
