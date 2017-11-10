class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameter , if: :devise_controller?

def configure_permitted_parameter
 
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name, :company_name, :telephone,:fax, :billing_address, :shipping_address])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company_name, :telephone,:fax, :web, :billing_address, :shipping_address])
end







end
