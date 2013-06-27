class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create, :update]

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:fname, :lname, :username, :email, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:fname, :lname, :username, :email, :password, :current_password) }
    end
end