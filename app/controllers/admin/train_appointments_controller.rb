class Admin::TrainAppointmentsController < ::Admin::ApplicationController
  before_action :set_trip
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments/new
  def new
    @appointment = @trip.appointments.new(type: 'TrainAppointment')
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  def create
    @appointment = @trip.appointments.build(type: 'TrainAppointment')
    @appointment.assign_attributes(appointment_params)

    if @appointment.save
      @trip.registrations.each do |registration|
        @appointment.train_tickets.create(registration: registration)
      end

      redirect_to [:admin, @trip], notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      redirect_to [:admin, @trip], notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    redirect_to [:admin, @trip], notice: 'Appointment was successfully destroyed.'
  end

  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = @trip.appointments.where(type: 'TrainAppointment').find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:train_appointment).permit(:scheduled_at, :company_id, :end_date, :from, :to, :address, :info, :origin_time_zone, :destination_time_zone)
    end
end
