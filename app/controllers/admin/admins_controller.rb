class Admin::AdminsController < ::Admin::ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admin/admins
  def index
    @admins = Admin.where.not(id: current_admin.id)
  end

  # GET /admin/admins/1
  def show
  end

  # GET /admin/admins/new
  def new
    @admin = Admin.new
  end

  # GET /admin/admins/1/edit
  def edit
  end

  # POST /admin/admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admin_admins_path, notice: 'Administrador cadastrado com sucesso'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/admins/1
  def update
    params[:admin].delete(:password) if params.dig(:admin, :password).blank?

    if @admin.update(admin_params)
      redirect_to admin_admins_path, notice: 'Administrador atualizado com sucesso'
    else
      render :edit
    end
  end

  # DELETE /admin/admins/1
  def destroy
    @admin.destroy
    redirect_to admin_admins_url, notice: 'Administrador removido com sucesso'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(:email, :name, :password)
    end
end
