class Admin::TransportsController < ::Admin::ApplicationController
  before_action :set_trip
  before_action :set_transport, only: [:show, :edit, :update, :destroy]

  # GET /transports
  def index
    @transports = @trip.transports
  end

  # GET /transports/1
  def show
  end

  # GET /transports/new
  def new
    @transport = @trip.transports.build
  end

  # GET /transports/1/edit
  def edit
  end

  # POST /transports
  def create
    @transport = @trip.transports.build(transport_params)

    if @transport.save
      @trip.registrations.each do |registration|
        @transport.transits.create(registration: registration)
      end

      redirect_to admin_trip_transports_path(@trip), notice: 'Transport was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transports/1
  def update
    if @transport.update(transport_params)
      redirect_to admin_trip_transports_path(@trip), notice: 'Transport was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transports/1
  def destroy
    @transport.destroy
    redirect_to admin_trip_transports_path(@trip), notice: 'Transport was successfully destroyed.'
  end

  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_transport
      @transport = @trip.transports.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transport_params
      params.require(:transport).permit(:company_id, :departure_at, :arrives_at, :origin, :destination, :attachment_url, :mean, :boarding_gate, :flight_number, :platform, transits_attributes: [:id, :seat])
    end
end
