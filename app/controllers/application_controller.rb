class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_location

  def set_location
	  city = request.location.city
		country = request.location.country_code

		puts "city"
		puts "country"
	end

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) << :fullname
  		devise_parameter_sanitizer.for(:account_update) << :fullname << :phone_number << :description << :email << :password
  	end
end
