class Admin::AirlinesController < ::Admin::ApplicationController
  before_action :set_airline, only: [:show, :edit, :update, :destroy]

  # GET /airlines
  def index
    @airlines = Airline.all
  end

  # GET /airlines/1
  def show
  end

  # GET /airlines/new
  def new
    @airline = Airline.new
  end

  # GET /airlines/1/edit
  def edit
  end

  # POST /airlines
  def create
    @airline = Airline.new(airline_params)

    if @airline.save
      redirect_to [:admin, @airline], notice: 'Companhia aérea criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /airlines/1
  def update
    if @airline.update(airline_params)
      redirect_to [:admin, @airline], notice: 'Companhia aérea atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /airlines/1
  def destroy
    @airline.destroy
    redirect_to airlines_url, notice: 'Companhia aérea removida com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airline
      @airline = Airline.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def airline_params
      params.require(:airline).permit(:openflight_id, :name, :name_alias, :iata, :icao, :callsign, :country, :active)
    end
end
