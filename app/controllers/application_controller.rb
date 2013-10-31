class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :configure_permitted_parameters_update, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized



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

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action"
    redirect_to request.headers["Referer"] || root_path
  end
end
