class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Conversation not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  def after_sign_in_path_for(resource)
    if session[:ride_params].present?
      param = session[:ride_params]
      session[:ride_params] = nil
      result_path(param)
    else
      session[:previous_url] || root_path
    end
  end

  def set_return_path
    unless devise_controller? || request.xhr? || !request.get?
      session[:previous_url] = request.url
    end
  end
end
