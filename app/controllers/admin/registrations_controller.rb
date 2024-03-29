class Admin::RegistrationsController < ::Admin::ApplicationController
  before_action :set_trip
  before_action :set_registration, only: [:show, :edit, :update, :itinerary, :destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @registrations = @trip.registrations.includes(:user).order('users.name asc')
    @registration = @trip.registrations.build
  end

  def show
  end

  def itinerary
    @reservations = @registration.hotel_reservations.includes(destination: [:hotel, :events]).joins(:destination).order('destinations.starts_at asc')
    @transits = @registration.transits.includes(transport: [:company]).joins(:transport).order('transports.departure_at asc')
  end

  # POST /hotels
  def create
    @trip = Trip.find(params[:trip_id])
    @registration = @trip.registrations.build(registration_params)

    if @registration.save
      @trip.flight_appointments.each do |appointment|
        @registration.flight_tickets.create(appointment: appointment)
      end

      @trip.train_appointments.each do |appointment|
        @registration.train_tickets.create(appointment: appointment)
      end

      @trip.hotel_appointments.each do |appointment|
        @registration.hotel_reservations.create(appointment: appointment)
      end

      redirect_to admin_trip_registrations_path(@trip), notice: 'Cliente adicionado com sucesso a viagem'
    else
      redirect_to admin_trip_registrations_path(@trip), alert: @registration.errors.full_messages.first
    end
  end

  def edit
  end

  def update
    if @registration.update_attributes(registration_params)
      redirect_to [:admin, @trip, :registrations]
    else
      render :edit
    end
  end

  # DELETE /hotels/1
  def destroy
    @registration.destroy
    redirect_to admin_trip_registrations_path(@trip), notice: 'Cliente removido com sucesso da viagem'
  end

  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = @trip.registrations.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registration_params
      params.require(:registration).permit(:user_id, :insurance, :insurance_cache)
    end
end
