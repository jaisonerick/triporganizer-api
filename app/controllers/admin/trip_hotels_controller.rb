class Admin::TripHotelsController < ::Admin::ApplicationController
  before_action :set_trip
  before_action :set_trip_hotel, only: [:show, :edit, :update, :destroy]

  # GET /trip_hotels
  def index
    @trip_hotels = @trip.trip_hotels
  end

  # GET /trip_hotels/1
  def show
  end

  # GET /trip_hotels/new
  def new
    @trip_hotel = @trip.trip_hotels.build
  end

  # GET /trip_hotels/1/edit
  def edit
  end

  # POST /trip_hotels
  def create
    @trip_hotel = @trip.trip_hotels.build(trip_hotel_params)

    if @trip_hotel.save
      redirect_to admin_trip_trip_hotels_path, notice: 'Trip hotel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trip_hotels/1
  def update
    if @trip_hotel.update(trip_hotel_params)
      redirect_to admin_trip_trip_hotels_path, notice: 'Trip hotel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trip_hotels/1
  def destroy
    @trip_hotel.destroy
    redirect_to admin_trip_trip_hotels_path, notice: 'Trip hotel was successfully destroyed.'
  end

  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_trip_hotel
      @trip_hotel = @trip.trip_hotels.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_hotel_params
      params.require(:trip_hotel).permit(:hotel_id, :trip_id, :notes, :starts_at, :ends_at)
    end
end
