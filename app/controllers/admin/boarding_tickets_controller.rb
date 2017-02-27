class Admin::BoardingTicketsController < ::Admin::ApplicationController
  before_action :set_boarding_ticket, only: [:show, :edit, :update, :destroy]

  # GET /boarding_tickets
  def index
    @trip = Trip.find(params[:trip_id])
    @registration = @trip.registrations.find(params[:registration_id])
    @boarding_tickets = @registration.boarding_tickets
  end

  # GET /boarding_tickets/1
  def show
  end

  # GET /boarding_tickets/new
  def new
    @trip = Trip.find(params[:trip_id])
    @registration = @trip.registrations.find(params[:registration_id])

    @boarding_ticket = @registration.boarding_tickets.build
  end

  # GET /boarding_tickets/1/edit
  def edit
  end

  # POST /boarding_tickets
  def create
    @trip = Trip.find(params[:trip_id])
    @registration = @trip.registrations.find(params[:registration_id])

    @boarding_ticket = @registration.boarding_tickets.build(boarding_ticket_params)

    if @boarding_ticket.save
      redirect_to admin_trip_registration_boarding_tickets_path(@trip, @registration), notice: 'Boarding ticket was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /boarding_tickets/1
  def update
    if @boarding_ticket.update(boarding_ticket_params)
      redirect_to admin_trip_registration_boarding_tickets_path(@trip, @registration), notice: 'Boarding ticket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /boarding_tickets/1
  def destroy
    @boarding_ticket.destroy
    redirect_to admin_trip_registration_boarding_tickets_path(@trip, @registration), notice: 'Boarding ticket was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boarding_ticket
      @trip = Trip.find(params[:trip_id])
      @registration = @trip.registrations.find(params[:registration_id])
      @boarding_ticket = @registration.boarding_tickets.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def boarding_ticket_params
      params.require(:boarding_ticket).permit(:flight_id, :flight_class, :seat, :qr_code, :notes)
    end
end
