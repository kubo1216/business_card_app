class ApplicationController < ActionController::Base
  
    protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # (省略)...

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
