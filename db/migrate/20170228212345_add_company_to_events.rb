class AddCompanyToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :company, foreign_key: true
  end
end
