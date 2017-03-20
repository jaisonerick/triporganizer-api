class Milestone < ApplicationRecord
  default_scope { order(order: :asc) }
  belongs_to :appointment
end
