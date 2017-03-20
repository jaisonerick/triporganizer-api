class Admin::MilestonesController < ::Admin::ApplicationController
  before_action :set_appointment
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]

  # GET /milestones
  def index
    @milestones = @appointment.milestones
  end

  # GET /milestones/1
  def show
  end

  # GET /milestones/new
  def new
    @milestone = @appointment.milestones.build
  end

  # GET /milestones/1/edit
  def edit
  end

  # POST /milestones
  def create
    @milestone = @appointment.milestones.build(milestone_params)

    if @milestone.save
      redirect_to [:admin, @trip], notice: 'Milestone was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /milestones/1
  def update
    if @milestone.update(milestone_params)
      redirect_to [:admin, @trip], notice: 'Milestone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /milestones/1
  def destroy
    @milestone.destroy
    redirect_to [:admin, @trip], notice: 'Milestone was successfully destroyed.'
  end

  private
    def set_appointment
      @trip = Trip.find(params[:trip_id])
      @appointment = @trip.appointments.find(params[:appointment_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone
      @milestone = @appointment.milestones.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def milestone_params
      params.require(:milestone).permit(:description, :order)
    end
end
