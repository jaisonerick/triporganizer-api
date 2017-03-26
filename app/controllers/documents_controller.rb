class DocumentsController < AuthenticatedController
  def index
    @trip = current_user.trips.visible.find(params[:trip_id])
    @registration = @trip.registrations.find_by!(user: current_user)
  end
end
