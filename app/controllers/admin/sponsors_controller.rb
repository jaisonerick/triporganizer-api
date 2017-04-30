class Admin::SponsorsController < ::Admin::ApplicationController
  before_action :set_trip
  before_action :set_sponsor, only: [:edit, :update, :destroy]

  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsors = @trip.sponsors
  end

  # GET /sponsors/new
  def new
    @sponsor = @trip.sponsors.new
  end

  # GET /sponsors/1/edit
  def edit
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = @trip.sponsors.build(sponsor_params)

    if @sponsor.save
      redirect_to admin_trip_sponsors_path(@trip), notice: 'Sponsor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sponsors/1
  # PATCH/PUT /sponsors/1.json
  def update
    if @sponsor.update(sponsor_params)
      redirect_to admin_trip_sponsors_path(@trip), notice: 'Sponsor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor.destroy
    redirect_to admin_trip_sponsors_path(@trip), notice: 'Sponsor was successfully destroyed.'
  end

  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = @trip.sponsors.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_params
      params.require(:sponsor).permit(:name, :image, :image_cache)
    end
end
