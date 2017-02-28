class Admin::HotelReservationsController < ::Admin::ApplicationController
  before_action :set_registration
  before_action :set_hotel_reservation, only: [:show, :edit, :update, :destroy]

  # GET /hotel_reservations
  def index
    @hotel_reservations = @registration.hotel_reservations
  end

  # GET /hotel_reservations/1
  def show
  end

  # GET /hotel_reservations/new
  def new
    @hotel_reservation = @registration.hotel_reservations.build
  end

  # GET /hotel_reservations/1/edit
  def edit
  end

  # POST /hotel_reservations
  def create
    @hotel_reservation = @registration.hotel_reservations.build(hotel_reservation_params)

    if @hotel_reservation.save
      redirect_to admin_trip_registration_hotel_reservations_path(@trip, @registration), notice: 'Reserva criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /hotel_reservations/1
  def update
    if @hotel_reservation.update(hotel_reservation_params)
      redirect_to admin_trip_registration_hotel_reservations_path(@trip, @registration), notice: 'Reserva criada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /hotel_reservations/1
  def destroy
    @hotel_reservation.destroy
    redirect_to admin_trip_registration_hotel_reservations_path(@trip, @registration), notice: 'Reserva removida com sucesso.'
  end

  private
    def set_registration
      @trip = Trip.find(params[:trip_id])
      @registration = @trip.registrations.find(params[:registration_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_reservation
      @hotel_reservation = @registration.hotel_reservations.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotel_reservation_params
      params.require(:hotel_reservation).permit(:registration_id, :destination_id, :room, :notes)
    end
end
