class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

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
