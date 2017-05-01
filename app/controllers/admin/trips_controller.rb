class Admin::TripsController < ::Admin::ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  def show
    @trip_dates = @trip.appointments.includes(:milestones).order(scheduled_at: :asc).group_by do |item|
      item.scheduled_at.to_date
    end
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to [:admin, @trip], notice: 'Viagem criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      redirect_to [:admin, @trip], notice: 'Viagem atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
    redirect_to admin_trips_url, notice: 'Viagem removida com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:name, :description, :starts_at, :ends_at, :image, :place, :promo_cache, :promo, :default_time_zone)
    end
end
