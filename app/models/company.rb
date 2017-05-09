class Company < ApplicationRecord
  mount_uploader :picture, ImageUploader
  has_many :events

  default_scope { order(name: :asc) }

  enum company_type: [:other, :bus, :train, :boat,
                      :airline, :hotel, :place]

  validates :name, presence: true

  validates :picture, :time_zone, presence: true, if: :place?

  attr_accessor :place
end
