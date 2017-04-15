class Api::UsersController < Api::BaseController
  def show
    render json: {
      name: current_user.name,
      email: current_user.email
    }
  end
end
