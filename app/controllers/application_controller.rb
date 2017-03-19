class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception

  private

  def after_sign_out_path_for(scope)
    if scope == :admin
      admin_root_path
    else
      root_path
    end
  end

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      'admin'
    else
      'application'
    end
  end
end
