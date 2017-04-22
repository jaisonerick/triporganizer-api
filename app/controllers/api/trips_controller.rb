class Api::TripsController < Api::BaseController
  def index
    @trips = current_user.trips.visible.nearest_order
    @upcoming = Trip.upcoming.where.not(id: @trips.map(&:id)).nearest_order

    @trips = @trips.map do |trip|
      [
        trip,
        trip.documents(current_user),
        trip.appointments.includes(:company, :milestones, flight_tickets: [:registration], hotel_reservations: [:registration]).order(scheduled_at: :asc).map { |appointment| appointment.passenger = current_user; appointment }.group_by do |item|
          item.scheduled_at.to_date
        end
      ]
    end
  end
end
