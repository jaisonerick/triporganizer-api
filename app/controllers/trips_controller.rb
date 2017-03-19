class TripsController < AuthenticatedController
  def index
    @trips = current_user.trips.visible.nearest_order
  end

  def show
    @trip = current_user.trips.visible.find(params[:id])
  end
end
