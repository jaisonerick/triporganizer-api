class Hotel < ApplicationRecord
  has_many :destinations

  validates :name, presence: true
end
