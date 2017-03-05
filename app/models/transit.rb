class Transit < ApplicationRecord
  belongs_to :registration
  belongs_to :transport

  store_accessor :specifics, :seat

  validates :registration, :transport, presence: true

  def transport_name
    transport.name
  end

  def company_name
    transport.company.name
  end

  def company_address
    transport.company.address
  end

  def mean_label
    transport.mean_label
  end

  def origin
    transport.origin
  end
  
  def departure_at
    transport.departure_at
  end

  def destination
    transport.destination
  end

  def arrives_at
    transport.arrives_at
  end
end
