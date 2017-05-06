class PasswordsController < Devise::PasswordsController
  protected
   def after_resetting_password_path_for(resource_name)
     password_changed_path
   end
end
