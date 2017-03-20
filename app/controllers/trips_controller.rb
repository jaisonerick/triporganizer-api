class TripsController < AuthenticatedController
  def index
    @trips = current_user.trips.visible.nearest_order
  end

  def show
    @trip = current_user.trips.visible.find(params[:id])

    @trip_dates = @trip.appointments.includes(:milestones).order(scheduled_at: :asc).group_by do |item|
      item.scheduled_at.to_date
    end
  end
end
