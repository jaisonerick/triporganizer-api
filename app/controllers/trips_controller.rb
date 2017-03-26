class TripsController < AuthenticatedController
  def index
    @trips = current_user.trips.visible.nearest_order
  end

  def show
    @trip = current_user.trips.visible.find(params[:id])

    @trip_dates = @trip.appointments.includes(:milestones, flight_tickets: [:registration], hotel_reservations: [:registration]).order(scheduled_at: :asc).map { |appointment| appointment.passenger = current_user; appointment }.group_by do |item|
      item.scheduled_at.to_date
    end
  end
end
