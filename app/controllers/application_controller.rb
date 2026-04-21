class ApplicationController < ActionController::Base
  add_flash_types :secondary, :success, :danger, :warning, :info, :light, :dark
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
