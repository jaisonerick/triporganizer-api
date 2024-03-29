class Admin::EventsController < ::Admin::ApplicationController
  before_action :set_destination
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = @destination.events.build(event_params)

    if @event.save
      redirect_to [:admin, @trip, @destination, @event], notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to [:admin, @trip, @destination, @event], notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to admin_trip_destination_events_path(@trip, @destination), notice: 'Event was successfully destroyed.'
  end

  private
    def set_destination
      @trip = Trip.find(params[:trip_id])
      @destination = @trip.destinations.find(params[:destination_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = @destination.events.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :description, :starts_at, :ends_at, :event_type, :company_id, :place_id)
    end
end
