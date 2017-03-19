class Admin::UsersController < ::Admin::ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  def index
    @admin_users = User.all
  end

  # GET /admin/users/1
  def show
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
    @admin_user.password = Devise.friendly_token.first(8)

    if @admin_user.save
      @admin_user.send_reset_password_instructions

      redirect_to [:admin, @admin_user], notice: 'Cliente criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/users/1
  def update
    if @admin_user.update(admin_user_params)
      redirect_to [:admin, @admin_user], notice: 'Cliente atualizado com sucesso.'
    else
      render :edit
    end
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
      params.require(:user).permit(:email, :name, :picture_url, :cpf, :birthday, :address, :phone)
    end
end
