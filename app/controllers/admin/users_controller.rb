class Admin::UsersController < ::Admin::ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy, :invite]

  # GET /admin/users
  def index
    @admin_users = User.all
  end

  # GET /admin/users/new
  def new
    @admin_user = User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  def create
    @admin_user = User.new(admin_user_params)

    if @admin_user.save
      redirect_to admin_users_path, notice: 'Cliente criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/users/1
  def update
    if @admin_user.update(admin_user_params)
      redirect_to admin_users_path, notice: 'Cliente criado com sucesso.'
    else
      render :edit
    end
  end

  def invite
    @admin_user.send_reset_password_instructions
    redirect_to admin_users_path, notice: 'Convite enviado com sucesso.'
  end

  # DELETE /admin/users/1
  def destroy
    @admin_user.destroy
    redirect_to admin_users_url, notice: 'Cliente removido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_user_params
      params.require(:user).permit(:email, :name, :password, :passport, :passport_cache, :phone)
    end
end
