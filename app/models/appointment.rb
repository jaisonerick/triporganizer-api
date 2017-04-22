class Appointment < ApplicationRecord
  belongs_to :trip
  belongs_to :company, optional: true

  has_many :milestones, dependent: :destroy

  has_many :flight_tickets, dependent: :destroy
  accepts_nested_attributes_for :flight_tickets

  has_many :train_tickets, dependent: :destroy
  accepts_nested_attributes_for :train_tickets

  has_many :hotel_reservations, dependent: :destroy
  accepts_nested_attributes_for :hotel_reservations

  validates :type, :scheduled_at, presence: true

  attr_accessor :flight_ticket, :train_ticket, :hotel_reservation

  def passenger=(passenger)
    self.flight_ticket = flight_tickets.select { |ticket| ticket.registration.user == passenger }.first.presence || FlightTicket.new
    self.train_ticket = train_tickets.select { |ticket| ticket.registration.user == passenger }.first.presence || TrainTicket.new
    self.hotel_reservation = hotel_reservations.select { |reservation| reservation.registration.user == passenger }.first.presence || HotelReservation.new
  end
end
