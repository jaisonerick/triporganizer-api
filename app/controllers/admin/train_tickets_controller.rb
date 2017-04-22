class Admin::TrainTicketsController < ::Admin::ApplicationController
  before_action :set_appointment

  def index
    @train_tickets = @appointment.train_tickets
  end

  def update
    if @appointment.update(train_appointment_params)
      redirect_to [:train_tickets, :admin, @trip, @appointment], notice: 'Passagens atualizadas com sucesso'
    else
      render :index
    end
  end

  private

    def set_appointment
      @trip = Trip.find(params[:trip_id])
      @appointment = @trip.appointments.find(params[:id])
    end

    def train_appointment_params
      params.require(:train_appointment).permit(train_tickets_attributes: [:id, :ticket, :details])
    end
end
