class DocumentsController < AuthenticatedController
  def index
    @trip = current_user.trips.visible.find(params[:trip_id])
  end
end
