class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin'

  def after_sign_out_path_for(scope)
    if scope == :admin
      admin_root_path
    else
      root_path
    end
  end
end
