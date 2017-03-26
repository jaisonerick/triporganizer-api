class TripsController < AuthenticatedController
  before_action :set_trip, only: [:show, :passport, :update_passport]

  def index
    @trips = current_user.trips.visible.nearest_order
  end

  def show
    @trip_dates = @trip.appointments.includes(:milestones, flight_tickets: [:registration], hotel_reservations: [:registration]).order(scheduled_at: :asc).map { |appointment| appointment.passenger = current_user; appointment }.group_by do |item|
      item.scheduled_at.to_date
    end
  end

  def passport
  end

  def update_passport
    if current_user.update_attributes(passport_params)
      redirect_to passport_trip_path(@trip)
    else
      render :passport
    end
  end

  private

    def set_trip
      @trip = current_user.trips.visible.find(params[:id])
    end

    def passport_params
      params.require(:user).permit(:passport, :passport_cache)
    end
end
