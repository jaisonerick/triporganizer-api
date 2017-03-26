class Admin::FlightTicketsController < ::Admin::ApplicationController
  before_action :set_appointment

  def index
    @flight_tickets = @appointment.flight_tickets
  end

  def update
    if @appointment.update(flight_appointment_params)
      redirect_to [:flight_tickets, :admin, @trip, @appointment], notice: 'Passagens atualizadas com sucesso'
    else
      render :edit
    end
  end

  private

    def set_appointment
      @trip = Trip.find(params[:trip_id])
      @appointment = @trip.appointments.find(params[:id])
    end

    def flight_appointment_params
      params.require(:flight_appointment).permit(flight_tickets_attributes: [:id, :seat, :details])
    end
end
