class Transit < ApplicationRecord
  belongs_to :registration
  belongs_to :transport

  store_accessor :specifics, :seat

  validates :registration, :transport, presence: true
end
