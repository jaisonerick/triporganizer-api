class Company < ApplicationRecord
  has_many :events

  enum company_type: [:other, :bus, :train, :boat]
end
