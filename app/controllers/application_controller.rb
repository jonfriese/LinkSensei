class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :configure_permitted_parameters_update, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def configure_permitted_parameters_update
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end
