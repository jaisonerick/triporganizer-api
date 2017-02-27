class Admin::RegistrationsController < ::Admin::ApplicationController
  before_action :set_registration, only: [:show, :destroy]

  def index
    @trip = Trip.find(params[:trip_id])
    @registrations = @trip.registrations.includes(:user)
    @registration = @trip.registrations.build
  end

  def show
  end

  # POST /hotels
  def create
    @trip = Trip.find(params[:trip_id])
    @registration = @trip.registrations.build(registration_params)

    if @registration.save
      redirect_to admin_trip_registrations_path(@trip), notice: 'Trip Registration was successfully created.'
    else
      redirect_to admin_trip_registrations_path(@trip), error: 'Failed to create a new trip registration'
    end
  end

  # DELETE /hotels/1
  def destroy
    @registration.destroy
    redirect_to admin_trip_registrations_path(@trip), notice: 'Registration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @trip = Trip.find(params[:trip_id])
      @registration = @trip.registrations.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registration_params
      params.require(:registration).permit(:user_id)
    end
end
