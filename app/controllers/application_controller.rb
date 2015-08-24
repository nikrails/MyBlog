class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!,:except => [:index]
  # before_filter :update_sanitized_params, if: :devise_controller?

 # def update_sanitized_params
  #   devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :loginable_type,:image,:first_name,:last_name)}
  #end
    rescue_from CanCan::AccessDenied do | exception |
    redirect_to main_app.root_path, alert: exception.message
  end
 def update_sanitized_params
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:current_password,:email, :password, :password_confirmation, :loginable_type,:image,:first_name,:last_name,:contact_no,:role)}
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :loginable_type,:image,:first_name,:last_name,:contact_no,:birth_date,:role)}
  end
 
   
end
