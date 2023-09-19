class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :edit_configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :reading_first_name, :reading_last_name, :birthday])
  end
  
  def edit_configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :first_name, :last_name, :reading_first_name, :reading_last_name, :birthday])
  end
end
