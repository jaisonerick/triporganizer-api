class Admin::TransitsController < ::Admin::ApplicationController
  before_action :set_registration
  before_action :set_transit, only: [:show, :edit, :update, :destroy]

  # GET /transits
  def index
    @transits = @registration.transits
  end

  # GET /transits/1
  def show
  end

  # GET /transits/new
  def new
    @transit = @registration.transits.build
  end

  # GET /transits/1/edit
  def edit
  end

  # POST /transits
  def create
    @transit = @registration.transits.build(transit_params)

    if @transit.save
      redirect_to admin_trip_registration_transits_path(@trip, @registration), notice: 'Transit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transits/1
  def update
    if @transit.update(transit_params)
      redirect_to admin_trip_registration_transits_path(@trip, @registration), notice: 'Transit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transits/1
  def destroy
    @transit.destroy
    redirect_to admin_trip_registration_transits_path(@trip, @registration), notice: 'Transit was successfully destroyed.'
  end

  private
    def set_registration
      @trip = Trip.find(params[:trip_id])
      @registration = @trip.registrations.find(params[:registration_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_transit
      @transit = @registration.transits.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transit_params
      params.require(:transit).permit(:transport_id, :seat, :attachment_url)
    end
end
