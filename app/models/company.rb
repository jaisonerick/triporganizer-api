class Company < ApplicationRecord
  has_many :events

  enum company_type: [:other, :bus, :train, :boat,
                      :airline, :hotel, :place]

  validates :name, presence: true

  attr_accessor :place
end
