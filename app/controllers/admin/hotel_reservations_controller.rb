class Admin::HotelReservationsController < ::Admin::ApplicationController
  before_action :set_appointment

  # GET /hotel_reservations
  def index
    @hotel_reservations = @appointment.hotel_reservations
  end

  # GET /hotel_reservations/1
  def show
  end

  # PATCH/PUT /hotel_reservations/1
  def update
    if @appointment.update(hotel_reservation_params)
      redirect_to [:hotel_reservations, :admin, @trip, @appointment], notice: 'Reservas atualizadas com sucesso'
    else
      render :index
    end
  end

  private
    def set_appointment
      @trip = Trip.find(params[:trip_id])
      @appointment = @trip.appointments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotel_reservation_params
      params.require(:hotel_appointment).permit(hotel_reservations_attributes: [:id, :room, :confirmation_code])
    end
end
