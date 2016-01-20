class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :disable_homenav, except: [:home, :search]
  


  def disable_nav
    @disable_nav = true   
  end

  def disable_homenav
    @disable_homenav = true   
  end

  def set_fullname
    fullname = "#{firstname} #{lastname}"
    
  end

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname << :fullname
  		devise_parameter_sanitizer.for(:account_update) << :firstname << :lastname << :fullname << :phone_number << :description << :email << :password
  	end
end
