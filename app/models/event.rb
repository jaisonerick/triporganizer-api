class Event < ApplicationRecord
  belongs_to :destination
  belongs_to :company
end
