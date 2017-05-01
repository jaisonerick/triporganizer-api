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

  before_validation :fix_time_zone

  after_initialize :init

  def init
    self.origin_time_zone ||= trip.try(:default_time_zone)
    self.destination_time_zone ||= trip.try(:default_time_zone)
  end

  def fix_time_zone
    if scheduled_at? && time_zone.present?
      self.scheduled_at = ActiveSupport::TimeZone.new(time_zone).local_to_utc(scheduled_at)
    end

    if end_date? && time_zone.present?
      self.end_date = ActiveSupport::TimeZone.new(time_zone).local_to_utc(end_date)
    end
  end


  def passenger=(passenger)
    self.flight_ticket = flight_tickets.select { |ticket| ticket.registration.user == passenger }.first.presence || FlightTicket.new
    self.train_ticket = train_tickets.select { |ticket| ticket.registration.user == passenger }.first.presence || TrainTicket.new
    self.hotel_reservation = hotel_reservations.select { |reservation| reservation.registration.user == passenger }.first.presence || HotelReservation.new
  end

  def formatted_time
    I18n.l(scheduled_at_local_time, format: :time)
  end

  def scheduled_at_local_time
    Time.use_zone(time_zone) { scheduled_at }
  end

  def end_date_local_time
    Time.use_zone(time_zone) { end_date }
  end

  def iso_time_zone
    ActiveSupport::TimeZone::MAPPING[company.time_zone]
  end

  def time_zone
    company.time_zone
  end
end
