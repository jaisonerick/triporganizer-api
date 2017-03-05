class Admin::RegistrationsController < ::Admin::ApplicationController
  before_action :set_trip
  before_action :set_registration, only: [:show, :itinerary, :destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @registrations = @trip.registrations.includes(:user)
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
      @trip.transports.each do |transport|
        @registration.transits.create(transport: transport)
      end

      @trip.destinations.each do |destination|
        @registration.hotel_reservations.create(destination: destination)
      end

      redirect_to admin_trip_registrations_path(@trip), notice: 'Cliente adicionado com sucesso a viagem'
    else
      redirect_to admin_trip_registrations_path(@trip), alert: @registration.errors.full_messages.first
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
      params.require(:registration).permit(:user_id)
    end
end
