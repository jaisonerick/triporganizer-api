class Admin::HotelsController < ::Admin::ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to [:admin, @hotel], notice: 'Hotel criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /hotels/1
  def update
    if @hotel.update(hotel_params)
      redirect_to [:admin, @hotel], notice: 'Hotel atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /hotels/1
  def destroy
    @hotel.destroy
    redirect_to admin_hotels_url, notice: 'Hotel removido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotel_params
      params.require(:hotel).permit(:name, :address, :city, :country, :latitude, :longitude, :phone, :email, :google_places_id)
    end
end
