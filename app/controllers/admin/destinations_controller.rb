class Admin::DestinationsController < ::Admin::ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  # GET /destinations
  def index
    @trip = Trip.find(params[:trip_id])
    @destinations = @trip.destinations
  end

  # GET /destinations/1
  def show
  end

  # GET /destinations/new
  def new
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.build
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  def create
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.build(destination_params)

    if @destination.save
      redirect_to admin_trip_destinations_path(@trip), notice: 'Destino criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /destinations/1
  def update
    if @destination.update(destination_params)
      redirect_to admin_trip_destinations_path(@trip), notice: 'Destino atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /destinations/1
  def destroy
    @destination.destroy
    redirect_to admin_trip_destinations_path(@trip), notice: 'Destino removido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @trip = Trip.find(params[:trip_id])
      @destination = @trip.destinations.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def destination_params
      params.require(:destination).permit(:name, :description, :starts_at, :ends_at, :address, :latitude, :longitude, :google_places_id, :picture_url, :hotel_id)
    end
end
