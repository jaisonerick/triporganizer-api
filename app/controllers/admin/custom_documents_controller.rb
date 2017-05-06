class Admin::CustomDocumentsController < ::Admin::ApplicationController
  before_action :set_trip
  before_action :set_custom_document, only: [:edit, :update, :destroy]

  # GET /custom_documents
  # GET /custom_documents.json
  def index
    @custom_documents = @trip.custom_documents.includes(registration: [:user]).order('users.name asc', 'custom_documents.name asc')
  end

  # GET /custom_documents/new
  def new
    @custom_document = CustomDocument.new
  end

  # GET /custom_documents/1/edit
  def edit
  end

  # POST /custom_documents
  # POST /custom_documents.json
  def create
    @custom_document = @trip.custom_documents.build(custom_document_params)

    if @custom_document.save
      redirect_to admin_trip_custom_documents_path(@trip), notice: 'Custom document was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /custom_documents/1
  # PATCH/PUT /custom_documents/1.json
  def update
    if @custom_document.update(custom_document_params)
      redirect_to admin_trip_custom_documents_path(@trip), notice: 'Custom document was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /custom_documents/1
  # DELETE /custom_documents/1.json
  def destroy
    @custom_document.destroy
    redirect_to admin_trip_custom_documents_path(@trip), notice: 'Custom document was successfully destroyed.'
  end

  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_custom_document
      @custom_document = @trip.custom_documents.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_document_params
      params.require(:custom_document).permit(:document, :document_cache, :name, :registration_id)
    end
end
