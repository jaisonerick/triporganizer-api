class Admin::FlightsController < ::Admin::ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  def index
    @trip = Trip.find(params[:trip_id])
    @flights = @trip.flights
  end

  # GET /flights/1
  def show
  end

  # GET /flights/new
  def new
    @trip = Trip.find(params[:trip_id])
    @flight = @trip.flights.build
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  def create
    @trip = Trip.find(params[:trip_id])
    @flight = @trip.flights.build(flight_params)

    if @flight.save
      redirect_to admin_trip_flights_path(@trip), notice: 'Voo adicionado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /flights/1
  def update
    if @flight.update(flight_params)
      redirect_to [:admin, @trip, @flight], notice: 'Voo atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /flights/1
  def destroy
    @flight.destroy
    redirect_to admin_trip_flights_path(@trip), notice: 'Voo removido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @trip = Trip.find(params[:trip_id])
      @flight = @trip.flights.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flight_params
      params.require(:flight).permit(:airline_id, :departure_at, :arrives_at, :flight_number, :origin, :destination, :boarding_gate, :phone, :trip_id)
    end
end
